## Customize Makefile settings for deep-learning-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

.PHONY: clean all

SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=tsv'

dlo-src.tsv:
	curl -L -s $(SRC_URL) > $@

# dlo-src-t.tsv: dlo-src.tsv
# 	./hack.pl $< > $@

# dlo-component.owl: dlo-src-t.tsv
dlo-component.owl: dlo-src.tsv
	robot template \
	  --add-prefix 'DLO: https://w3id.org/dlo/' \
	  --add-prefix 'oio: http://www.geneontology.org/formats/oboInOwl#' \
	  -t $< \
	  annotate --annotation-file deep-learning_annotations.ttl \
	  -o $@

# hacky step for now - but we should treat as a proper component
deep-learning-ontology-edit.owl: dlo-component.owl
	cp $< $@

clean:
	rm -rf dlo-src.tsv
	rm -rf dlo-src-t.tsv
	rm -rf dlo-component.owl
	rm -rf deep-learning-ontology-edit.owl
