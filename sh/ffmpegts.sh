#!/usr/bin/env bash

for file in *.ts; do
    ffmpeg -i "$file" -c copy "${file%.ts}.mp4"
done
