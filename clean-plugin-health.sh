#!/usr/bin/env bash

set -e

# TODO: check existance of parameter

# Select messages from november 2022
grep '^[0-9][0-9]/11/2022,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' > cleaned-gsoc-health-score.txt
# Select messages from Decemeber 2022
grep '^[0-9][0-9]/12/2022,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' >> cleaned-gsoc-health-score.txt
# Select messages for 2023
grep '^[0-9][0-9]/[0-9][0-9]/2023,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' >> cleaned-gsoc-health-score.txt

cat cleaned-gsoc-health-score.txt | grep -o " - .*: " | sed 's/ - //' | sed 's/:/;/' > gsoc-Health-score-users.txt