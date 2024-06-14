---
name: New Issue
about: Use this template for opening a new technical issue with the ontology.
title: "[NEW ISSUE]"
body:
    - type: markdown
      attributes:
        value: For new issues, please provide the following information.
    - type: input
      id: issue
      attributes:
        label: Issue
        description: What is the issue and how was it observed?
      validations:
        required: true
    - type: input
      id: release_version
      attributes:
        label: Release Version
        description: What was the last release version of the ontology you observed the issue within?
        placeholder: "2024-03-31"
