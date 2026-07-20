---
layout: ontology_detail
id: aio
title: Artificial Intelligence Ontology
jobs:
  - id: https://travis-ci.org/berkeleybop/artificial-intelligence-ontology
    type: travis-ci
build:
  checkout: git clone https://github.com/berkeleybop/artificial-intelligence-ontology.git
  system: git
  path: "."
contact:
  email: 
  label: 
  github: 
description: The Artificial Intelligence Ontology (AIO) is a systematization of artificial intelligence concepts, methodologies, and their interrelations, spanning networks, layers, functions, large language models, preprocessing, and bias.
domain: artificial intelligence
homepage: https://github.com/berkeleybop/artificial-intelligence-ontology
products:
  - id: aio.owl
    name: "Artificial Intelligence Ontology main release in OWL format"
  - id: aio.obo
    name: "Artificial Intelligence Ontology additional release in OBO format"
  - id: aio.json
    name: "Artificial Intelligence Ontology additional release in OBOJSon format"
  - id: aio/aio-base.owl
    name: "Artificial Intelligence Ontology main release in OWL format"
  - id: aio/aio-base.obo
    name: "Artificial Intelligence Ontology additional release in OBO format"
  - id: aio/aio-base.json
    name: "Artificial Intelligence Ontology additional release in OBOJSon format"
dependencies:
- id: swo

tracker: https://github.com/berkeleybop/artificial-intelligence-ontology/issues
license:
  url: https://creativecommons.org/licenses/by/4.0/
  label: CC-BY 4.0
activity_status: active
---

The Artificial Intelligence Ontology (AIO) systematizes artificial intelligence concepts, methodologies, and their interrelations. It is organized into six top-level branches (Networks, Layers, Functions, LLMs, Preprocessing, and Bias) designed to support the modular composition of AI methods and to capture both technical and ethical aspects of AI. AIO is developed with the Ontology Development Kit (ODK) and LLM-assisted curation, and is distributed via GitHub and BioPortal.

AIO aligns with OBO Foundry standards and principles but is not part of the OBO Foundry: its scope extends beyond biology, it does not use OBO IDs, and it does not conform to an upper ontology. Terms in AIO may nevertheless be imported by OBO ontologies using standard workflows.

See the AIO paper: Joachimiak et al. (2024), "The Artificial Intelligence Ontology: LLM-assisted construction of AI concept hierarchies," Applied Ontology, doi:10.1177/15705838241304103 (open access: arXiv:2404.03044).

