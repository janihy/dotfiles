#!/usr/bin/env bash

# now playing script for use with polybar.
# supports mpris2, and for chromium as player it digs the url and sets the logo

get_now_playing_client () {
    # figure out who is playing, should be only one so we pick the first
    if [[ $(playerctl -a metadata -f "{{ playerName }} {{ status }}") =~ ([a-z]+)\ Playing ]];
    then
        CLIENT=${BASH_REMATCH[1]}
    else
        return -1
    fi
}

get_now_playing_client || echo ""

now_playing=$(playerctl --player=$CLIENT metadata title)
echo $now_playing
