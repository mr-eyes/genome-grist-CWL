#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [genome-grist, run, "conf-tutorial.yml", "summarize"]

hints:
  DockerRequirement:
    dockerPull: "mlim13/ggristv2:tag2"

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.sourmash_database_glob_pattern)
      - entryname: conf-tutorial.yml
        entry: |-
          sample:
            - $(inputs.sample_name)
          outdir: $(inputs.outdir)
          metagenome_trim_memory: $(inputs.metagenome_trim_memory)
          sourmash_database_glob_pattern: $(inputs.sourmash_database_glob_pattern.basename)

inputs: 
  sample_name: string
  outdir: string
  metagenome_trim_memory: float
  sourmash_database_glob_pattern:
    type: File
      
outputs:
  html_report:
    type: File
    outputBinding:
      glob: outputs.tutorial/reports/*.html