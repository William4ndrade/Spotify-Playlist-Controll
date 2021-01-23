#!/bin/bash

UserURI="eoq-287"
NowPlaylistURI="0ZWbnvgoAbXzhMDA0uxjUx"
SertanojoPlaylistURI="1c3VLuXmsyUGTxbiSKJvUl"
Teste=$(ps aux | grep "spotify" | wc -l)

OpenAndPlayPlaylist()
{
    Playlist=$1
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.OpenUri string:spotify:user:$UserURI:playlist:$Playlist
}



if [ $Teste -gt 3 ];
then
    if [ $1 = "now" ];
    then 
        OpenAndPlayPlaylist $NowPlaylistURI | echo "Now selecionada tocando"
    elif [ $1 = "sertanojo" ];
    then
        OpenAndPlayPlaylist $SertanojoPlaylistURI | echo "Sertanojo tocando"
    else
        echo "LHE FALTA ARGUMENTOS"
    fi
else 
    (spotify 1>/dev/null 2>&1 &)
    echo "Musica irá começar em 4 segundos"
    sleep 4
    if [ $1 = "now" ];
    then 
        OpenAndPlayPlaylist $NowPlaylistURI | echo "Now selecionada tocando"
    elif [ $1 = "sertanojo" ];
    then
        OpenAndPlayPlaylist $SertanojoPlaylistURI | echo "Sertanojo tocando"
    else
        echo "LHE FALTA ARGUMENTOS"
    fi


    
fi