#! /usr/bin/env bash

user=martin
device=schlumpfmobil

payload=$(jo _type=location \
   t=u \
   batt=11 \
   lat=48.1459 \
   lon=11.7388 \
   tid=JJ \
   tst=$(date +%s) \
   topic="owntracks/$user/$device")

curl --data "${payload}" https://otrecorder.patz.app/pub?u=${user}&d=${device}
