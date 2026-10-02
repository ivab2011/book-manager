#!/bin/bash
codex exec --skip-git-repo-check --sandbox read-only \
  "Identify the main genre of the book titled '$1' by '$2'.
Return only the genre in English, on one line.
If uncertain, return Unknown.
Do not modify any files."
