#!/usr/bin/env bash
if [[ `git status --porcelain` ]]; then
	echo "changes"
else
	echo "No Changes"
fi