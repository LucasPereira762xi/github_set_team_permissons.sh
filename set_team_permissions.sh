#!/bin/bash

# Check for file input
if [ -z "$1" ]; then
  echo "Usage: $0 repos.txt"
  exit 1
fi

TEAM="saas-magento"
FILE="$1"

while IFS= read -r line; do

  line=$(echo "$line" | tr -d '" ')

  ORG=$(echo "$line" | cut -d'/' -f1)
  REPO=$(echo "$line" | cut -d'/' -f2)

  echo "Setting permission for team '$TEAM' on $ORG/$REPO..."

  gh api \
    -X PUT \
    -H "Accept: application/vnd.github.v3+json" \
    "/orgs/$ORG/teams/$TEAM/repos/$ORG/$REPO" \
    -f permission=push

  echo "Done."
done < "$FILE"

