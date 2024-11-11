aio.db: aio.owl # requires that rdftab and relation0graph have been installed locally and are on the default path
# truly local build saying ValueError: numpy.dtype size changed, may indicate binary incompatibility. Expected 96 from C header, got 88 from PyObject
# or create with docker run  -v $PWD:/work -w /work -ti linkml/semantic-sql semsql make aio.db
	poetry run semsql make $@
	#docker run  -v $$PWD:/work -w /work -ti linkml/semantic-sql semsql make $@
	rm -rf aio-relation-graph.tsv.gz

aio-root-statistics.tsv: aio.db # could use sqlite:obo:aio if the file in the BBOP S3 bucket is new enough
	poetry run runoak \
		--input $< statistics \
		-O tsv -o $@ $$(poetry run runoak --input $< roots | cut -f 1 | sed '1d' | tr '\n' ' ')

aio-root-statistics-transposed-filtered.tsv: aio-root-statistics.tsv
	python ../scripts/transpose_filter_statistics.py < $< > $@