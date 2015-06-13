#!/bin/bash
currentName=${PWD##*/}
git archive --format zip --prefix "$currentName/" --output "$currentName.zip" master

