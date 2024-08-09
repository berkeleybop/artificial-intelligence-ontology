cp aio-to-cso.sssom.tsv aio-to-cso.sssom_full.tsv
cp aio-to-edam.sssom.tsv aio-to-edam.sssom_full.tsv
cp aio-to-ito.sssom.tsv aio-to-ito.sssom_full.tsv
cp aio-to-mlo.sssom.tsv aio-to-mlo.sssom_full.tsv
cp aio-to-ncit.sssom.tsv aio-to-ncit.sssom_full.tsv
cp aio-to-obiws.sssom.tsv aio-to-obiws.sssom_full.tsv
cp aio-to-swo.sssom.tsv aio-to-swo.sssom_full.tsv

grep -E '^aio:|Match	aio:' aio-to-cso.sssom_full.tsv > aio-to-cso.sssom_T.tsv
grep -E '^aio:|Match	aio:' io-to-edam.sssom_full.tsv > aio-to-edam.sssom_T.tsv
grep -E '^aio:|Match	aio:' aio-to-ito.sssom_full.tsv >  aio-to-ito.sssom_T.tsv
grep -E '^aio:|Match	aio:' aio-to-mlo.sssom_full.tsv > aio-to-mlo.sssom_T.tsv
grep -E '^aio:|Match	aio:' aio-to-ncit.sssom_full.tsv> aio-to-ncit.sssom_T.tsv
grep -E '^aio:|Match	aio:' aio-to-obiws.ssso_fullm.tsv > aio-to-obiws.sssom_T.tsv
grep -E '^aio:|Match	aio:' aio-to-swo.sssom_full.tsv > aio-to-swo.sssom_T.tsv

cat sssom_header.tsv aio-to-cso.sssom_T.tsv > aio-to-cso.sssom.tsv
cat sssom_header.tsv aio-to-edam.sssom_T.tsv > aio-to-edam.sssom.tsv
cat sssom_header.tsv aio-to-ito.sssom_T.tsv > aio-to-ito.sssom.tsv
cat sssom_header.tsv aio-to-mlo.sssom_T.tsv > aio-to-mlo.sssom.tsv
cat sssom_header.tsv aio-to-ncit.sssom_T.tsv > aio-to-ncit.sssom.tsv
cat sssom_header.tsv aio-to-obiws.sssom_T.tsv > aio-to-obiws.sssom.tsv
cat sssom_header.tsv aio-to-swo.sssom_T.tsv > aio-to-swo.sssom.tsv



