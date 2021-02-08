#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  curl_url: string
  curl_output: string
  sample_name: string
  showconf_cmd: string
  outdir: string
  metagenome_trim_memory: float
  conf_file:
    type: File
  summarize_command: string


outputs:
  db_zip:
    type: File
    outputSource: curl/zip_file
  confYaml:
    type: File
    outputSource: confTutorial/conf_tutorial_yaml
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
    
    
  confTutorial:
    run: conf_yaml.cwl
    in:
      sample_name: sample_name
      outdir: outdir
      sourmash_database_glob_pattern: curl/zip_file
      metagenome_trim_memory: metagenome_trim_memory
    out: [ conf_tutorial_yaml ]
      
    
  summarize:
    run: summarize.cwl
    in:
      sample_name: sample_name
      summarize_command: summarize_command
      showconf_cmd: showconf_cmd
      conf_file: confTutorial/conf_tutorial_yaml
    out: [ html_report ]