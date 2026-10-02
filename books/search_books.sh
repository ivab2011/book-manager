#!/bin/bash
search_term="$1"

if [ "$#" -eq 0 ]; then
  read -r search_term
fi

if [ -z "$search_term" ]; then
  echo "Please enter a search term."
  exit 1
fi

bash data/book_database.sh search "$search_term"
