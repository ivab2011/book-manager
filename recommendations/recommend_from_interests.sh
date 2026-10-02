#!/bin/bash
#!/bin/bash
codex exec --skip-git-repo-check --sandbox read-only \
  "Recommend 3 real books about these interests: $1.
Output only one book per line as Title | Author | Short reason.
Do not modify any files."
