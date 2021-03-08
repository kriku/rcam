#!/bin/bash

serverurl='rtmp://live-arn.twitch.tv/app/'$TWITCH_AUTH
gst-launch-1.0 \
    -e nvarguscamerasrc sensor-id=0 \
    ! "video/x-raw(memory:NVMM),width=1920,height=1080,framerate=60/1" \
    ! nvvidconv flip-method=2 \
    ! x264enc key-int-max=60 \
    ! h264parse \
    ! flvmux name=mux \
    mux. ! rtmpsink location=$serverurl

    # audiotestsrc ! queue ! audioconvert ! ffenc_aac ! aacparse ! mux. \

    # TWITCH
    # rtmp://live-arn.twitch.tv/app
