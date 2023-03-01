#!/usr/bin/env bash

set -e

# TODO: check existance of parameter

# Select messages from november 2022
grep '^[0-9][0-9]/11/2022,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' > cleaned-gsoc-sig.txt
# Select messages from Decemeber 2022
grep '^[0-9][0-9]/12/2022,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' >> cleaned-gsoc-sig.txt
# Select messages for 2023
grep '^[0-9][0-9]/[0-9][0-9]/2023,' "$1" | grep -v 'joined the room' | grep -v 'message deleted' | grep -v 'gitter-badger (The Gitter Badger)' >> cleaned-gsoc-sig.txt

# extract the users
cat cleaned-gsoc-sig.txt | grep -o " - .*: " | sed 's/ - //' | sed 's/:/;/' > gsoc-sig-users.txt