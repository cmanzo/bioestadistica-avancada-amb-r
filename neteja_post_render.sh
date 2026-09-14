#!/bin/bash
# neteja_post_render.sh — run after `quarto render`
#
# Some chapters regenerate simulated datasets under datasets/ via write.csv()
# every time they run. Even with set.seed(), tiny floating-point formatting
# differences could leave noisy diffs on files that shouldn't actually change.
# The generation code now rounds these values, but this script is kept as a
# safety net: it restores the committed version of the generated datasets so
# `git status` only shows real edits.
#
# Usage: ./neteja_post_render.sh   (run from the NotesBioestAvan/ folder)

set -e
cd "$(dirname "$0")"

git checkout -- \
  datasets/bioreact/*.csv \
  datasets/correl/*.csv \
  datasets/duplicacio/*.csv \
  datasets/regressio/*.csv \
  datasets/promotor/*.csv \
  datasets/analgesic/*.csv \
  datasets/fonaments/*.csv

echo "Datasets restored to committed version."
