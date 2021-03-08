#!/bin/bash

################## YouTube Settings ###################
# These data are available to you when you create a Live event in YouTube
# First Camera - INSERT YOUR OWN DATA
twitch_auth='live_157756298_YKuHdqiKwSm3gCOLc3Z6FBElJ7SXwq'
# youtube_auth='usse-0e3k-6qjr-53bh-5bab'
# youtube_app='live2'
# serverurl='rtmp://a.rtmp.youtube.com/'$youtube_app'/'$youtube_auth
serverurl='rtmp://live-arn.twitch.tv/app/'$twitch_auth
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
