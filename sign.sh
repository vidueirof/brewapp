#!/bin/bash

PATH=$PATH:/opt/adt-bundle-mac-x86_64-20140702/sdk/build-tools/25.0.0

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /Users/vidueirof/projects/android_key/EudaimoniaKey -storepass vfede133 -keypass vfede133 platforms/android/build/outputs/apk/android-release-unsigned.apk eudaimonia
zipalign -v 4 platforms/android/build/outputs/apk/android-release-unsigned.apk platforms/android/build/outputs/apk/bom.apk
