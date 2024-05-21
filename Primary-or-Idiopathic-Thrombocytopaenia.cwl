cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary:
    run: thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  primary-or-idiopathic-thrombocytopaenia-purpura---primary:
    run: primary-or-idiopathic-thrombocytopaenia-purpura---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary/output
  essential-primary-or-idiopathic-thrombocytopaenia---primary:
    run: essential-primary-or-idiopathic-thrombocytopaenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: primary-or-idiopathic-thrombocytopaenia-purpura---primary/output
  other-primary-or-idiopathic-thrombocytopaenia---primary:
    run: other-primary-or-idiopathic-thrombocytopaenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: essential-primary-or-idiopathic-thrombocytopaenia---primary/output
  primary-or-idiopathic-thrombocytopaenia---primary:
    run: primary-or-idiopathic-thrombocytopaenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: other-primary-or-idiopathic-thrombocytopaenia---primary/output
  primary-or-idiopathic-thrombocytopaenia-evan's---primary:
    run: primary-or-idiopathic-thrombocytopaenia-evan's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: primary-or-idiopathic-thrombocytopaenia---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: primary-or-idiopathic-thrombocytopaenia-evan's---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
