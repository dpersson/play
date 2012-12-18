#!/bin/bash

echo  "H.264 / ACC"
ffmpeg -i $1 -b 1500k -vcodec libx264 -preset slow -g 30 -s 640x360 -strict -2 $1.mp4
echo "VP8 / Vorbis"
ffmpeg -i $1 -b 1500k -vcodec libvpx -acodec libvorbis -ab 160000 -f webm    -g 30 -s 640x360 $1.webm
echo "Theora / Vorbis"
ffmpeg -i $1 -b 1500k -vcodec libtheora  -acodec libvorbis -ab 160000 -g 30 -s 640x360 $1.ogv
echo "screenshot at 10 seconds"
ffmpeg -i $1 -ss 00:10 -vframes 1 -r 1 -s 640x360 -f image2 $1.jpg
