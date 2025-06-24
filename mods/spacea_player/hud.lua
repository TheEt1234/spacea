core.register_on_joinplayer(function(player_ref, last_login)
    player_ref:hud_set_hotbar_image 'spacea_player_hotbar.png'
    player_ref:hud_set_hotbar_selected_image 'spacea_player_hotbar_selected.png'
end)
