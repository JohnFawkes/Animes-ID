#!/bin/bash
tail -n +2 "$SCRIPT_FOLDER/cr-award/cr-award.tsv" > "$SCRIPT_FOLDER/tmp/cr-award.tsv"
< "$SCRIPT_FOLDER/tmp/cr-award.tsv" jq -s  --slurp --raw-input --raw-output 'split("\n") | .[0:-1] | map(split("\t")) |
	map({"tvdb_id": .[0],
	"tvdb_season": .[1],
	"imdb_id": .[2],
	"anilist_id": .[3],
	"year": .[4],
	"cr_award": .[5]})' > "cr-award.json"
