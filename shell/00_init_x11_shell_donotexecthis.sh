xauth add unix:1 . $(xauth list | awk '/unix:/ {print $NF; exit}')
