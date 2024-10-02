# The following file is a bash script to start the flutter project
PATH="$PATH:~/Desktop/flutter/bin"
Xvfb -ac :99 -screen 0 1280x1024x16 &
export DISPLAY=:99
