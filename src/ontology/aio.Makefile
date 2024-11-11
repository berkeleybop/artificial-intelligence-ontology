## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all

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

components/aio-component.owl: aio-src.csv
	# the prefix AIO is used in the Google Sheet so we provide an expansion here
	# but aio-edit.owl asserts the same expansion for aio, so that becomes authoritative downstream
	robot template \
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
	rm -rf aio.db aio-root-statistics* aio-2024-06-26.owl current-vs-2024-06-26-diff*

remove-old-input:
	rm -rf aio-src.csv
	rm -rf components/aio-component.owl

components-from-new-input: remove-old-input
	make aio-src.csv
	make components/aio-component.owl

aio-2024-06-26.owl:
	wget -O $@ "https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/v2024-06-26/aio.owl"

current-vs-2024-06-26-diff.txt: aio.owl aio-2024-06-26.owl
	robot diff --left $< --right aio-2024-06-26.owl --output $@

current-vs-2024-06-26-diff-skip-defs.txt: current-vs-2024-06-26-diff.txt
	cat $< | grep -v IAO_0000115 > $@


include stats-with-semsql.Makefile