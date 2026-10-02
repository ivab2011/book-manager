#!/bin/bash
echo "Main menu"
while true; do
izbor=$(gum choose "Browse Library" "Add Book" "Search Library" "Get Recommendations" "Update Status" "Rate Book" "Quit")
echo "You selected: $izbor"
if [ "$izbor" = "Browse Library" ]; then
  bash ui/library_screen.sh
elif [ "$izbor" = "Add Book" ]; then
  read -r -p "Book title: " title
read -r -p "Author: " author
status=$(gum choose "want_to_read" "reading" "finished" "owned")
bash workflows/manage_library.sh add "$title" "$author" "$status"
elif [ "$izbor" = "Search Library" ]; then
  read -r -p "Search for: " search_term
bash workflows/manage_library.sh search "$search_term"
elif [ "$izbor" = "Get Recommendations" ]; then
  read -r -p "What topics interest you? " interests
bash workflows/get_recommendations.sh "$interests"
elif [ "$izbor" = "Update Status" ]; then
  read -r -p "Book title: " title
  read -r -p "Author: " author
  status=$(gum choose "want_to_read" "reading" "finished" "owned")
  bash workflows/manage_library.sh update_status "$title" "$author" "$status"
elif [ "$izbor" = "Rate Book" ]; then
  read -r -p "Book title: " title
  read -r -p "Author: " author
  rating=$(gum choose "1" "2" "3" "4" "5")
  bash workflows/manage_library.sh update_rating "$title" "$author" "$rating"
elif [ "$izbor" = "Quit" ]; then
  echo "Goodbye!"
break
fi
done
