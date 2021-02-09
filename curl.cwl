#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: curl

hints:
  DockerRequirement:
    dockerPull: "curlimages/curl:latest"
inputs:
  curl_url:
    type: string
    inputBinding:
      position: 1
      prefix: -L
      
  curl_output:
    type: string
    inputBinding:
      position: 2
      prefix: -o
      
outputs:
  zip_file:
    type: File
    outputBinding:
      glob: gtdb-r95.nucleotide-k31-scaled1000.sbt.zip