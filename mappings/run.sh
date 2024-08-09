runoak -i sqlite:obo:cso -a sqlite:obo:aio lexmatch i^cso @ i^aio -o aio-to-cso.sssom.tsv
runoak -i sqlite:obo:ncit -a sqlite:obo:aio lexmatch i^ncit @ i^aio -o aio-to-ncit.sssom.tsv
runoak -i sqlite:obo:ito -a sqlite:obo:aio lexmatch i^ito @ i^aio -o aio-to-ito.sssom.tsv
runoak -i sqlite:obo:edam -a sqlite:obo:aio lexmatch i^edam @ i^aio -o aio-to-edam.sssom.tsv
runoak -i sqlite:obo:obiws -a sqlite:obo:aio lexmatch i^obiws @ i^aio -o aio-to-obiws.sssom.tsv
runoak -i sqlite:obo:mlo -a sqlite:obo:aio lexmatch i^mlo @ i^aio -o aio-to-mlo.sssom.tsv
runoak -i sqlite:obo:swo -a sqlite:obo:aio lexmatch i^swo @ i^aio -o aio-to-swo.sssom.tsv


