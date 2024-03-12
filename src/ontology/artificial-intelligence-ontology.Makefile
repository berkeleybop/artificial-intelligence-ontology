## Customize Makefile settings for artificial-intelligence-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


.PHONY: clean all

SRC_URL = 'https://docs.google.com/spreadsheets/d/1LVubUGg56YDGJ0VUdJDMNBPY8iFfissRfy4eM56bUFg/export?exportFormat=tsv'

aio-src.tsv:
	curl -L -s $(SRC_URL) > $@

# aio-src-t.tsv: aio-src.tsv
# 	./hack.pl $< > $@

# aio-component.owl: aio-src-t.tsv
aio-component.owl: aio-src.tsv
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
	rm -rf aio-src-t.tsv
	rm -rf aio-component.owl
	rm -rf aio-edit.owl

../../external/methods.yaml: ../../external/methods.json
	# --container-class-name
	# --format (yaml by default)
	# --enum-columns
	# --enum-mask-columns
	# --max-enum-size
	# --enum-threshold
	# --omit-null
	poetry run schemauto generalize-json $< \
		--enum-threshold 999 \
		--schema-name PwcMethods \
		--output $@

../../external/methods_curated.ttl: ../../external/methods_curated.yaml
	#  --metadata-profile [linkml|rdfs], [default: linkml]
	# --type-objects / --no-type-objects, [default: type-objects]
	#  --metaclasses / --no-metaclasses, [default: metaclasses]
	#  --add-ols-annotations / --no-add-ols-annotations, [default: add-ols-annotations]
	#  --ontology-iri-suffix , [default: .owl.ttl]
	#  -f, --format [owl|ttl|json-ld|xml|n3|turtle|ttl|ntriples|nt|nt11|nquads|trix|trig|hext], [default: owl]
	#  --metadata / --no-metadata, [default: metadata]
	#  --useuris / --metauris, [default: useuris]
	#  -im, --importmap FILENAME       Import mapping file
	#  --mergeimports / --no-mergeimports, (default=mergeimports)
	poetry run gen-owl $< \
		--output $@
