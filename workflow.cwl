#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  curl_url: string
  curl_output: string
  sample_name: string
  outdir: string
  metagenome_trim_memory: float

outputs:
  db_zip:
    type: File
    outputSource: curl/zip_file

  summarize_html:
    type: File
    outputSource: summarize/html_report
    
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
      sample_name: sample_name
      metagenome_trim_memory: metagenome_trim_memory
      outdir: outdir
      sourmash_database_glob_pattern: curl/zip_file
    out: [ html_report ]