runoak -i sqlite:obo:cso -a aio.owl lexmatch i^cso @ i^aio -o aio-to-cso.sssom_full.tsv
runoak -i sqlite:obo:ncit -a aio.owl lexmatch i^ncit @ i^aio -o aio-to-ncit.sssom_full.tsv
runoak -i sqlite:obo:edam -a aio.owl lexmatch i^edam @ i^aio -o aio-to-edam.sssom_full.tsv
runoak -i sqlite:obo:mlo -a aio.owl lexmatch i^mlo @ i^aio -o aio-to-mlo.sssom_full.tsv
runoak -i sqlite:obo:swo -a aio.owl lexmatch i^swo @ i^aio -o aio-to-swo.sssom_full.tsv


