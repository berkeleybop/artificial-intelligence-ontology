awk '/match_string: / {print tolower(substr($0, index($0, "match_string: ") + 13))}' methods_reformat_annotate_AIOonly.txt | sort | uniq -c | sort -nr > PWC_AIO_terms_wcounts.txt


