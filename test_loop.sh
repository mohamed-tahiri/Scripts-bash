#!/usr/bin/env bash
echo "--- 1. Unquoted \$* ---"
echo "Result: arguments are split on spaces (WRONG)"
echo "Loop cout on depends on word-splitting"
for arg in $*; do
	echo "Argument: '$arg'"
done
echo 
echo "--- 2. Quoted \"\$*\" ---"
echo "Result: loop runs 1 time (WRONG)"
echo "\"\$*\" expends to ONE string: all args joined by spaces"
for arg in "$*"; do
	echo "Argument: '$arg'"
done
echo 
echo "--- 3. Unquoted \$@ ---"
echo "Result: arguments are split on spaces (WRONG)"
echo "Same problem as \$*: word splitting"
for arg in $@; do
	echo "Argument: '$arg'"
done
echo 
echo "--- 4. quoted \"\$@\" ---"
echo "Result: loop runs once per real argument (CORRECT)"
echo "\"\$@\" preserves each argument as a separate item"
for arg in "$@"; do 
	echo "Argument: '$arg'"
done

