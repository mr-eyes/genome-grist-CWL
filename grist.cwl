#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [make, test]

hints:
  DockerRequirement:
    dockerPull: "mlim13/ggrist:tag0"
    
inputs:
  grist_directory:
    type: string
    inputBinding:
        position: 1
        prefix: --directory
        
outputs:
  example_out:
    type: stdout
stdout: grist_stdout.txt
