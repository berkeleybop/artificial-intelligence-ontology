## Customize Makefile settings for deep-learning-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=tsv'

dlo-src.tsv:
	curl -L -s $(SRC_URL) > $@

dlo-src-t.tsv: dlo-src.tsv
	./hack.pl $< > $@

dlo-component.owl: dlo-src-t.tsv
	robot template --add-prefix 'DLO: https://w3id.org/dlo/' -t $< -o $@

# hacky step for now - but we should treat as a proper component
deep-learning-ontology-edit.owl: dlo-component.owl
	cp $< $@

