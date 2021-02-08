#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [genome-grist, run]

hints:
  DockerRequirement:
    dockerPull: "mlim13/ggristv2:tag2"

inputs:
  sample_name: string
  conf_file:
    type: File
    inputBinding:
      position: 1
      
  summarize_command:
    type: string
    inputBinding:
      position: 2
      
outputs:
  html_report:
    type: File
    outputBinding:
      glob: outputs.tutorial/reports/report-$(inputs.sample_name).html
  csv_report:
    type: File
    outputBinding:
      glob: outputs.tutorial/genbank/$(inputs.sample_name).genomes.info.csv