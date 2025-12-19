#!/bin/sh

while IFS= read -r DATE; do
    echo "Commit at $DATE"
    echo "- Update at $DATE" >> readme.md

    git add readme.md

    GIT_AUTHOR_DATE="$DATE" \
    GIT_COMMITTER_DATE="$DATE" \
    git commit -m "Fake commit for $DATE" --date "$DATE"

done < dates.txt
