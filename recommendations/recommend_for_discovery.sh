#!/bin/bash
codex exec --skip-git-repo-check --sandbox read-only \
  "My usual interests are: $1.
Recommend 3 real books outside these interests to broaden my perspective.
Output only one book per line as Title | Author | Short reason.
Do not modify any files."
