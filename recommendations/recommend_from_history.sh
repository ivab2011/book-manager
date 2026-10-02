#!/bin/bash
library=$(bash data/book_database.sh list)

codex exec --skip-git-repo-check --sandbox read-only \
  "Based on this library, recommend 3 real books not already listed:
$library
Output only one book per line as Title | Author | Short reason.
Do not modify any files."
