#!/bin/bash
candidates=$(cat)
library=$(bash data/book_database.sh list)

codex exec --skip-git-repo-check --sandbox read-only \
  "Select up to 5 books from these candidates:
$candidates

Exclude books already in this library:
$library

Remove duplicate books. Rank the most useful recommendations first.
Output only one book per line as Title | Author | Short reason.
Do not modify any files."
