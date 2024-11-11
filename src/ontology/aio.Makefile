## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all all-extras-all all-extras-clean all-extras-build

all-extras-all: all-extras-clean all-extras-build

all-extras-clean: clean clean-extras remove-old-input

all-extras-build: components-from-new-input all bridge/aio-bridge-to-upper.owl

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

aio.db: aio.owl # requires that rdftab and relation0graph have been installed locally and are on the default path
# truly local build saying ValueError: numpy.dtype size changed, may indicate binary incompatibility. Expected 96 from C header, got 88 from PyObject
# or create with docker run  -v $PWD:/work -w /work -ti linkml/semantic-sql semsql make aio.db
	#poetry run semsql make $@
	docker run  -v $$PWD:/work -w /work -ti linkml/semantic-sql semsql make $@
	rm -rf aio-relation-graph.tsv.gz

aio-root-statistics.tsv: aio.db # could use sqlite:obo:aio if the file in the BBOP S3 bucket is new enough
	poetry run runoak \
		--input $< statistics \
		-O tsv -o $@ $$(poetry run runoak --input $< roots | cut -f 1 | sed '1d' | tr '\n' ' ')

aio-root-statistics-transposed-filtered.tsv: aio-root-statistics.tsv
	python ../scripts/transpose_filter_statistics.py < $< > $@

aio-2024-06-26.owl:
	wget -O $@ "https://raw.githubusercontent.com/berkeleybop/artificial-intelligence-ontology/v2024-06-26/aio.owl"

current-vs-2024-06-26-diff.txt: aio.owl aio-2024-06-26.owl
	robot diff --left $< --right aio-2024-06-26.owl --output $@

current-vs-2024-06-26-diff-skip-defs.txt: current-vs-2024-06-26-diff.txt
	cat $< | grep -v IAO_0000115 > $@