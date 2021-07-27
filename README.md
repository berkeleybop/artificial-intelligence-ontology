
![Build Status](https://github.com/turbomam/deep-learning-ontology/workflows/CI/badge.svg)
# Deep Learning Ontology

### Move as much of this as possible into the Makefile

```Bash
cd src/ontology
make clean
make -f deep-learning-ontology.Makefile deep-learning-ontology-edit.owl
make all
less reports/deep-learning-ontology-edit.owl-obo-report.tsv
# optionally
make release
# optionally
#   assumes robot on the system path
#   how to use robot provided by ODK?
cd ../..
robot convert -i deep-learning-ontology.owl -o deep-learning-ontology.json
# optionally
#   assumes npm and node are on the system path
npm i obographviz
./node_modules/obographviz/bin/og2dot.js deep-learning-ontology.json > deep-learning-ontology.dot
#   assumes dot from graphviz is on the path
dot deep-learning-ontology.dot -Tpng -Grankdir=BT > learning-ontology.png

```

### See also
- https://github.com/cmungall/obographviz
- https://www.npmjs.com/package/obographviz

> (node:4752) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/MAM/Documents/gitrepos/deep-learning-ontology/node_modules/node-getopt/package.json' of './lib'. Please either fix that or report it to the module author

### BioPortal integration
- https://bioportal.bioontology.org/ontologies/DLO
- todo: document settings

----

This ontology... YOUR DESCRIPTION HERE

More information can be found at http://obofoundry.org/ontology/deep-learning-ontology

## Versions

### Stable release versions

The latest version of the ontology can always be found at:

http://purl.obolibrary.org/obo/deep-learning-ontology.owl

(note this will not show up until the request has been approved by obofoundry.org)

### Editors' version

Editors of this ontology should use the edit version, [src/ontology/deep-learning-ontology-edit.owl](src/ontology/deep-learning-ontology-edit.owl)

## Contact

Please use this GitHub repository's [Issue tracker](https://github.com/turbomam/deep-learning-ontology/issues) to request new terms/classes or report errors or specific concerns related to the ontology.

## Acknowledgements

This ontology repository was created using the [ontology starter kit](https://github.com/INCATools/ontology-starter-kit)
