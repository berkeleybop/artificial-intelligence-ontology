## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all

SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=tsv'

aio-src.tsv:
	curl -L -s $(SRC_URL) > $@

# aio-component.owl: aio-src-t.tsv
aio-component.owl: aio-src.tsv
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

# hacky step for now - but we should treat as a proper component
aio-edit.owl: aio-component.owl
	cp $< $@

clean:
	rm -rf aio-src.tsv
	rm -rf aio-component.owl
	rm -rf aio-edit.owl
