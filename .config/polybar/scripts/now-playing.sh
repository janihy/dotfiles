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

case $CLIENT in
  spotify)
    # add spotify focus action to left-click: click-left = i3-msg '[class="Spotify"] focus'
    now_playing=$(playerctl --player=$CLIENT metadata -f "{{ artist }} - {{ title }}")
    logo="%{F#1DB954}%{F-}"
    ;;
  chrome)
    now_playing=$(playerctl --player=$CLIENT metadata -f "{{ title }}")
    url=$(playerctl --player chrome metadata -f "{{ xesam:url }}")
    case $url in
        *youtube*)
            logo="%{F#FF0000}%{F-}"
        ;;
        *soundcloud*)
            logo="%{F#ff8800}%{F-}"
        ;;
        *)
            logo=""
    esac
    ;;
  chromium)
    now_playing=$(playerctl --player=$CLIENT metadata -f "{{ title }}")
    logo="%{F#FF0000}%{F-}"
    ;;
esac

echo $logo $now_playing
