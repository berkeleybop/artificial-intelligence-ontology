## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all all-extras-all all-extras-clean all-extras-build

all-extras-all: all-extras-clean all-extras-build

all-extras-clean: clean clean-extras remove-old-input

all-extras-build: components-from-new-input all bridge/aio-bridge-to-upper.owl

# Fail QC on ROBOT report ERRORs (matches cell-ontology, uberon, pato).
# The source of truth for this is robot_report.fail_on in aio-odk.yaml; this
# override makes it effective now, before the next `make update_repo`
# regenerates the main Makefile from that config. aio.Makefile is included
# after the generated default (REPORT_FAIL_ON = none), so this wins.
REPORT_FAIL_ON = ERROR

# Source of truth for AIO.
# This is a ROBOT template.
SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=csv'
SRC_CSV_FILE = aio-src.csv

RELEASE_ASSETS = \
  $(MAIN_FILES) \
  $(SUBSET_FILES) \
  $(REPORT_FILES) \
  $(SRC_CSV_FILE)

# TODO: ensure this gets checked in to the repo
aio-src.csv:
	curl -L -s $(SRC_URL) > $@

components/aio-component.owl: aio-src.csv relation-declarations.ttl
	# the prefix AIO is used in the Google Sheet so we provide an expansion here
	# but aio-edit.owl asserts the same expansion for aio, so that becomes authoritative downstream
	# --input declares the BFO relations as object properties so `robot template` does not
	# mint a spurious owl:DatatypeProperty for has part (issue #93)
	robot template \
	  --input relation-declarations.ttl \
	  --add-prefix 'AIO: https://w3id.org/aio/' \
	  --add-prefix 'oio: http://www.geneontology.org/formats/oboInOwl#' \
	  -t $< \
	  annotate --annotation-file aio-annotations.ttl \
	  -o $@

components/%.owl: components/%.csv
	robot template \
	  --add-prefix 'AIO: https://w3id.org/aio/' \
	  --add-prefix 'oio: http://www.geneontology.org/formats/oboInOwl#' \
	  -t $< \
	  annotate --annotation-file aio-annotations.ttl \
	  -o $@

clean-extras:
	rm -rf aio.db aio-root-statistics* bridge/aio-bridge-to-upper.owl aio-2024-06-26.owl current-vs-2024-06-26-diff* aio-relation-graph.tsv.gz

remove-old-input:
	rm -rf aio-src.csv
	rm -rf components/aio-component.owl

components-from-new-input: remove-old-input
	make aio-src.csv
	make components/aio-component.owl

bridge/aio-bridge-to-upper.owl: bridge/aio-bridge-to-upper.tsv
	robot template \
    --prefix 'aio: https://w3id.org/aio/' \
    --template $< \
    --output $@

# Validate that the release conforms to the OWL 2 EL profile. AIO intentionally
# targets EL (it is reasoned with ELK; see the AIO paper), so a non-EL construct
# is a defect. This guards against regressions such as the has part
# object/datatype punning fixed in issue #93.
.PHONY: validate-el-profile
validate-el-profile:
	robot validate-profile --profile EL --input $(RELEASEDIR)/aio.owl --output $(REPORTDIR)/aio-el-profile.txt

# Run the EL profile check as part of the standard test suite.
test: validate-el-profile

include stats-with-semsql.Makefile
