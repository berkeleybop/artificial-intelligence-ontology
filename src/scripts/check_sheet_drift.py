#!/usr/bin/env python3
"""Check that the committed aio-src.csv still agrees with the source Google Sheet.

The sheet is the upstream source (see SRC_URL in src/ontology/aio.Makefile), but
the committed CSV is a snapshot that can drift from it. This script fetches a fresh
export of the sheet and compares the two on the columns that feed the ontology:
the label (Name) and the definition (Curated Claude opus Aristotelian definition).

It deliberately ignores the formula/QC columns (ID, jaccard, lookups), which export
non-deterministically and are not part of the built ontology. See issue #153.

Exit codes:
  0  no build-relevant drift (or the sheet could not be fetched: network is not a
     reason to fail a build, so a fetch error warns and passes)
  1  the committed CSV and the sheet disagree on a label or definition

Usage: python check_sheet_drift.py [path-to-aio-src.csv]
"""
import csv
import io
import sys
import urllib.request

SHEET_ID = "1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg"
EXPORT_URL = f"https://docs.google.com/spreadsheets/d/{SHEET_ID}/export?exportFormat=csv"

NAME_COL = 4   # "Name" (LABEL)
DEF_COL = 10   # "Curated Claude opus Aristotelian definition" (A IAO:0000115)


def load(text):
    """Map ID -> row, skipping the two header rows."""
    rows = list(csv.reader(io.StringIO(text)))
    return {r[0]: r for r in rows[2:] if len(r) > DEF_COL and r[0]}


def cell(row, i):
    return row[i] if i < len(row) else ""


def main():
    repo_path = sys.argv[1] if len(sys.argv) > 1 else "src/ontology/aio-src.csv"
    with open(repo_path, encoding="utf-8") as fh:
        repo = load(fh.read())

    try:
        with urllib.request.urlopen(EXPORT_URL, timeout=60) as resp:
            sheet = load(resp.read().decode("utf-8"))
    except Exception as exc:  # network/availability is not a build failure
        print(f"WARNING: could not fetch the source sheet ({exc}); skipping drift check.")
        return 0

    issues = []
    for key in sorted(set(repo) | set(sheet)):
        if key not in repo:
            issues.append((key, "only in sheet", "", ""))
            continue
        if key not in sheet:
            issues.append((key, "only in repo", "", ""))
            continue
        for i, name in ((NAME_COL, "label"), (DEF_COL, "definition")):
            rv, sv = cell(repo[key], i), cell(sheet[key], i)
            if rv != sv:
                issues.append((key, name, rv, sv))

    for key, what, rv, sv in issues:
        print(f"DRIFT {key} [{what}]: repo={rv[:60]!r} sheet={sv[:60]!r}")

    if issues:
        print(f"\n{len(issues)} build-relevant divergence(s) between aio-src.csv and the source sheet.")
        print("Reconcile the sheet and the committed CSV (see issue #153), then re-run.")
        return 1
    print("aio-src.csv agrees with the source sheet on all labels and definitions.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
