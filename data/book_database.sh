#!/bin/bash
if [ "$1" = "list" ]; then
  cat data/books.csv
elif [ "$1" = "init" ]; then
    if [ -f "data/books.csv" ]; then
    echo "Database already exists."
  else
    echo "title,author,genre,status,rating,link" > data/books.csv
echo "Database created."
  fi
elif [ "$1" = "add" ]; then
  if [ -z "$2" ] || [ -z "$3" ]; then
    echo "Title and author are required."
    exit 1
  fi
  echo "Adding book: $2 by $3"
title=${2//\"/\"\"}
author=${3//\"/\"\"}
genre=${5//\"/\"\"}
printf '"%s","%s","%s",%s,,\n' "$title" "$author" "$genre" "${4:-want_to_read}" >> data/books.csv
elif [ "$1" = "repair" ]; then
  sed -i '.bak' 's/^Eat,pray,love,Elizabeth Gilbert,,want_to_read,,$/"Eat,pray,love","Elizabeth Gilbert",,want_to_read,,/' data/books.csv
elif [ "$1" = "search" ]; then
  tail -n +2 data/books.csv | grep -iF -- "$2"
elif [ "$1" = "update_status" ] || [ "$1" = "update_rating" ]; then
  python3 - "$2" "$3" "$4" "$1" <<'PY'
import csv
import sys

title, author, value, action = sys.argv[1:]
field = "status" if action == "update_status" else "rating"
allowed = {"want_to_read", "reading", "finished", "owned"} if field == "status" else {"1", "2", "3", "4", "5"}

if value not in allowed:
    sys.exit("Invalid value.")

with open("data/books.csv", newline="") as file:
    reader = csv.DictReader(file)
    fields = reader.fieldnames
    books = list(reader)

found = False
for book in books:
    if book["title"] == title and book["author"] == author:
        book[field] = value
        found = True

if not found:
    sys.exit("Book not found.")

with open("data/books.csv", "w", newline="") as file:
    writer = csv.DictWriter(file, fieldnames=fields)
    writer.writeheader()
    writer.writerows(books)

print("Book updated.")
PY
elif [ "$1" = "exists" ]; then
  python3 - "$2" "$3" <<'PY'
import csv
import sys

title, author = sys.argv[1:]

with open("data/books.csv", newline="") as file:
    for book in csv.DictReader(file):
        if (book["title"].casefold() == title.casefold()
                and book["author"].casefold() == author.casefold()):
            sys.exit(0)

sys.exit(1)
PY
else
  echo "Unknown action."
fi
