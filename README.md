
![Build Status](https://github.com/berkeleybop/aio/workflows/CI/badge.svg)
# Artificial Intelligence Ontology

An ontology modeling classes and relationships describing deep learning networks, their component layers and activation functions, machine learning methods, as well as AI/ML potential biases.

More information can be found at http://obofoundry.org/ontology/aio

### Move as much of this as possible into the Makefile

```Bash
cd src/ontology
make clean
make -f aio.Makefile aio-edit.owl
make all
less reports/aio-edit.owl-obo-report.tsv
# optionally
make release
# optionally
#   assumes robot on the system path
#   how to use robot provided by ODK?
cd ../..
robot convert -i aio.owl -o aio.json
# optionally
#   assumes npm and node are on the system path
npm i obographviz
./node_modules/obographviz/bin/og2dot.js aio.json > aio.dot
#   assumes dot from graphviz is on the path
dot aio.dot -Tpng -Grankdir=BT > learning-ontology.png

```

### See also
- https://github.com/cmungall/obographviz
- https://www.npmjs.com/package/obographviz

> (node:4752) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/MAM/Documents/gitrepos/aio/node_modules/node-getopt/package.json' of './lib'. Please either fix that or report it to the module author

### BioPortal integration
- https://bioportal.bioontology.org/ontologies/AIO

----

## Versions

### Stable release versions

The latest version of the ontology can always be found at:

http://purl.obolibrary.org/obo/aio.owl

(note this will not show up until the request has been approved by obofoundry.org)

### Editors' version

Editors of this ontology should use the edit version, [src/ontology/aio-edit.owl](src/ontology/aio-edit.owl)

## Contact

Please use this GitHub repository's [Issue tracker](https://github.com/turbomam/aio/issues) to request new terms/classes or report errors or specific concerns related to the ontology.

## Acknowledgements

This ontology repository was created using the [ontology starter kit](https://github.com/INCATools/ontology-starter-kit)
