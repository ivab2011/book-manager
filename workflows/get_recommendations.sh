#!/bin/bash
interests="$1"
temp_dir=$(mktemp -d)

echo "Finding recommendations..."

bash recommendations/recommend_from_history.sh > "$temp_dir/history" &
history_pid=$!

bash recommendations/recommend_from_interests.sh "$interests" > "$temp_dir/interests" &
interests_pid=$!

bash recommendations/recommend_for_discovery.sh "$interests" > "$temp_dir/discovery" &
discovery_pid=$!

wait "$history_pid"
history_result=$?
echo "History finished (status: $history_result)."

wait "$interests_pid"
interests_result=$?
echo "Interests finished (status: $interests_result)."

wait "$discovery_pid"
discovery_result=$?
echo "Discovery finished (status: $discovery_result)."

cat "$temp_dir/history" "$temp_dir/interests" "$temp_dir/discovery" |
  bash recommendations/refine_recommendations.sh |
  bash ui/recommendations_screen.sh
rm -r "$temp_dir"
