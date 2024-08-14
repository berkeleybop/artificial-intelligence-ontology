grep -E 'https://w3id.org/aio/' aio-to-cso.sssom_full.tsv > aio-to-cso.sssom_T.tsv
grep -E 'https://w3id.org/aio/' aio-to-edam.sssom_full.tsv > aio-to-edam.sssom_T.tsv
grep -E 'https://w3id.org/aio/' aio-to-mlo.sssom_full.tsv > aio-to-mlo.sssom_T.tsv
grep -E 'https://w3id.org/aio/' aio-to-ncit.sssom_full.tsv > aio-to-ncit.sssom_T.tsv
grep -E 'https://w3id.org/aio/' aio-to-swo.sssom_full.tsv > aio-to-swo.sssom_T.tsv

cat sssom_header.tsv aio-to-cso.sssom_T.tsv > aio-to-cso.sssom.tsv
cat sssom_header.tsv aio-to-edam.sssom_T.tsv > aio-to-edam.sssom.tsv
cat sssom_header.tsv aio-to-mlo.sssom_T.tsv > aio-to-mlo.sssom.tsv
cat sssom_header.tsv aio-to-ncit.sssom_T.tsv > aio-to-ncit.sssom.tsv
cat sssom_header.tsv aio-to-swo.sssom_T.tsv > aio-to-swo.sssom.tsv
