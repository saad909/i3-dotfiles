song_name=$( cmus-remote -Q | grep "tag title" | cut -c 10- |xargs)
artist_name=$( cmus-remote -Q | grep "tag artist" | cut -c 11- |xargs)
printf "Artist:$artist_name\n"
printf "Title:$artist_name"
