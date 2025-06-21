#!/bin/bash

# Hey so, you need the lua lsp installed
# Just a heads up
# I know nobody will
# `paru -S lua-language-server`
# Also, bash scripting is weird i don't want to do this again

GAME_DIR="$HOME/.minetest/games/spacea"
echo "Game directory: $GAME_DIR"

lua-language-server --doc=$GAME_DIR --doc_out_path="$GAME_DIR/dev/doc/"
