youtube-dl-in-ruby-not-python for Sally.

1. Set the location to download videos into. (In 'lib/ytdl/configuration.rb'.)

2. From the console, run `ruby youtube-dl-in-ruby-not-python.rb`.

3. Download videos
```
~/ytdl-ruby (master) $ ruby youtube-dl-in-ruby-not-python.rb
============================================================
# 1. List up the videos you want to download
# : https://www.youtube.com/watch?###
# : https://www.youtube.com/watch?###
# : https://www.youtube.com/watch?###
# :
# 2. OK. I'll download 3 videos
# In progress 1/3
[youtube] mNkh0KOlHY0: Downloading webpage
...
[download] 100% of 7.27MiB in 00:02
# In progress 2/3
[youtube] 4QnPNleGIgE: Downloading webpage
...
[download] 100% of 54.06MiB in 00:07
# In progress 3/3
[youtube] 8y2pFAW6iz8: Downloading webpage
...
[download] 100% of 14.72MiB in 00:04
# 3. Find your videos in $YOUR_DIR/$DATE_OF_TODAY
============================================================
~/ytdl-ruby (master) $
```

4. You'll be able to find the thumbnails here - `$YOUR_DIR/$DATA_OF_TODAY/gallery.html`

