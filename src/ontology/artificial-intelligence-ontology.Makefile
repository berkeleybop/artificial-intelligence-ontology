## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all

# Source of truth for AIO.
# This is a ROBOT template.
SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=csv'

# TODO: ensure this gets checked in to the repo
aio-src.csv:
	curl -L -s $(SRC_URL) > $@

components/aio-component.owl: aio-src.csv
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
