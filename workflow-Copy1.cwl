#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  curl_url: string
  curl_output: string
  sample_name: string
  conf_file:
    type: File
  summarize_command: string

outputs:
  compiled_class:
    type: File
    outputSource: compile/classfile

steps:
  curl:
    run: curl.cwl
    in:
      curl_url: curl_url
      curl_output: curl_output
    out: [ zip_file ]

  summarize:
    run: summarize.cwl
    in:
      src: untar/extracted_file
    out: [classfile]