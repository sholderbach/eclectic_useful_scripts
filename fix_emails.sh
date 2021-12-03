#!/usr/bin/env bash

# Usage: ./fix_emails <old_email> <new username> <new email>
# Replace your git identity in a series of commit that had a previous email
# Ignores other peoples identities
# DO NOT use that if you already pushed the history upstream
# Adapted from https://stackoverflow.com/a/2931914/15171257
git filter-branch --commit-filter '
      if [ "$GIT_AUTHOR_EMAIL" = "$1" ];
      then
              GIT_AUTHOR_NAME="$2";
              GIT_AUTHOR_EMAIL="$3";
              git commit-tree "$@";
      else
              git commit-tree "$@";
      fi' HEAD
