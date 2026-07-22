# Release diffs

Auto-generated, human-readable comparisons between AIO releases. Each file is a
`robot diff` of two `aio.owl` builds, so reviewers can see exactly which axioms
a release adds, removes, or changes without reading the raw OWL.

## Naming

`aio-diff_<old-version>_to_<new-version>.md`, where the versions are the release
dates (the `owl:versionInfo` / version IRI date of each build).

## How they are generated

Label-annotated markdown, left = older release, right = newer build:

```
robot diff --labels true \
  --left  <old-release>/aio.owl \
  --right <new-build>/aio.owl \
  -f markdown \
  -o docs/release-diffs/aio-diff_<old>_to_<new>.md
```

Strip the `Loaded from:` lines after generating (`| grep -v '^- Loaded from:'`).
They record the transient input file path (a docker mount like `/base` or
`/work`), carry no release information beyond the IRI lines above them, and would
otherwise churn on every regeneration.

The ODK `release_diff` target produces the same output, but it compares against
whatever `w3id.org/aio/aio.owl` resolves to (currently `main/aio.owl`), which is
the latest committed build, not necessarily the last tagged GitHub Release. To
diff against a specific published release, download that release's `aio.owl` and
pass it as `--left`, as above.

## Files

- [aio-diff_2024-11-08_to_2026-07-22.md](aio-diff_2024-11-08_to_2026-07-22.md):
  last published release (v2024-11-08) vs the 2026-07-22 regeneration. Covers the
  w3id IRI switch, the ontology metadata added in issue #171 (root terms,
  creators, citation), definition de-truncations and typo fixes, `@en` tags on
  subset annotations, and two curation fixes (DataEnhancement synonym,
  Distillation subset).
