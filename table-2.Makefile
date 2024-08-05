.PHONY: branch-counts synonym-counts is_a-edge-counts

branch-counts.tsv: src/ontology/aio.owl
	arq --data $< --query branch-counts.rq --results=TSV > $@

synonym-counts.tsv: src/ontology/aio.owl
	arq --data $< --query synonym-counts.rq --results=TSV > $@

is_a-edge-counts.tsv: src/ontology/aio.owl
	arq --data $< --query is_a-edge-counts.rq --results=TSV > $@

