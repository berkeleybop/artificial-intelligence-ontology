import sys

prefixes = ('id', 'class_count', 'subclass_of_axiom_count', 'distinct_synonym_count')
lines = [line.strip().split('\t') for line in sys.stdin]
transposed = zip(*lines)
filtered = [row for row in transposed if row[0] in prefixes]
print('\n'.join('\t'.join(item for item in row) for row in filtered))
