**youtube-dl-in-ruby-not-python** for [Sally](http://line.wikia.com/wiki/Sally) is a script to add a console ui to youtube-dl in Ruby.
```
~/ytdl-ruby (master) $ ruby youtube-dl-in-ruby-not-python.rb
============================================================
# 1. List up the videos you want to download
# : https://www.youtube.com/watch?###
# : https://www.youtube.com/watch?###
# : https://www.youtube.com/watch?###
# :
# 2. OK. I'll download 3 videos
  ...
# 3. Find your videos in $YOUR_DIR/$DATE_OF_TODAY
# 4. Find the list of your videos with thumbnails here $YOUR_DIR/$DATE_OF_TODAY/gallery.html
============================================================
~/ytdl-ruby (master) $
```
1. Set the location to download videos into, in `lib/ytdl/configuration.rb`.
2. From the terminal, run `ruby youtube-dl-in-ruby-not-python.rb`.
3. Download videos using the console ui.
