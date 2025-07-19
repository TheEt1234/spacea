#!/bin/bash
ffmpeg -i $1 -ac 1 $1.mono.ogg
mv $1.mono.ogg $1
