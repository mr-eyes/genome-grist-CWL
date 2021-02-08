#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0

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
            sourmash_database_glob_pattern: $(inputs.sourmash_database_glob_pattern.path)

inputs:
  sample_name: string
  outdir: string
  sourmash_database_glob_pattern:
    type: File
  metagenome_trim_memory: float
  
  
outputs:
  conf_tutorial_yaml:
    type: File
    outputBinding:
      glob: conf-tutorial.yml