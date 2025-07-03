GAME_DIR="$HOME/.minetest/games/spacea"
OUTPUT=$(cat $GAME_DIR/dev/lsp_definitions/luanti/*.lua)
LICENSE=$(cat $GAME_DIR/dev/lsp_definitions/luanti/LICENSE)

echo "--[[$LICENSE]]$OUTPUT"
