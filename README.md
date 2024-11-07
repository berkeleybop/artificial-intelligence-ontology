
# Artificial Intelligence Ontology (AIO)

An ontology modeling classes and relationships describing deep learning networks, their component layers and activation functions, machine learning methods, as well as AI/ML potential biases.

More information can be found at <https://berkeleybop.github.io/artificial-intelligence-ontology/>

or on BioPortal at <https://bioportal.bioontology.org/ontologies/AIO>

----

## Versions

### Stable release versions

The latest version of the ontology can always be found in this repository in

[aio.owl](aio.owl)

### Editors' version

Editors of this ontology should use the edit version, [src/ontology/aio-edit.owl](src/ontology/aio-edit.owl)

## Bridge axioms

Bridges between AIO and top-level ontologies are provided here: [src/ontology/bridge/aio-bridge-to-upper.owl](src/ontology/bridge/aio-bridge-to-upper.owl)

These include:

| AIO label                | OBO label                  | OBO id      |
|--------------------------|----------------------------|-------------|
| aio:Bias                 | disposition                | BFO:0000016 |
| aio:MathematicalFunction | planned process            | IAO:0000033 |
| aio:Layer                | information content entity | IAO:0000030 |
| aio:MachineLearningTask  | planned process            | OBI:0000011 |
| aio:Model                | information content entity | IAO:0000030 |
| aio:Network              | information content entity | IAO:0000030 |
| aio:Preprocessing        | planned process            | OBI:0000011 |

## Contact

Please use this GitHub repository's [Issue tracker](https://github.com/berkeleybop/artificial-intelligence-ontology/issues) to request new terms/classes or report errors or specific concerns related to the ontology.

## Acknowledgements

This ontology repository was created using the [Ontology Development Kit](https://github.com/INCATools/ontology-development-kit).
