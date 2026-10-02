#!/bin/bash
if [ "$1" = "list" ]; then
  bash data/book_database.sh list
elif [ "$1" = "add" ]; then
if bash data/book_database.sh exists "$2" "$3"; then
  echo "This book is already in your library."
  exit 1
fi
genre=$(bash books/fetch_book_metadata.sh "$2" "$3") || exit 1
bash data/book_database.sh add "$2" "$3" "$4" "$genre"
elif [ "$1" = "search" ]; then
  bash books/search_books.sh "$2"
elif [ "$1" = "update_status" ]; then
  bash data/book_database.sh update_status "$2" "$3" "$4"
elif [ "$1" = "update_rating" ]; then
  bash data/book_database.sh update_rating "$2" "$3" "$4"
fi
