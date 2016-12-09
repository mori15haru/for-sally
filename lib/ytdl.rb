require_relative 'ytdl/configuration.rb'

module Ytdl
  def self.download(urls)
    validate_dir
    urls.each_with_index do |url, index|
      puts "# In progress #{index+1}/#{urls.count}"
      run(url)
    end
  end

  private

  # adds the videos to 'path/year-month-date' folder
  # creates a new folder when it doesn't exist
  # Ytdl::Configuration.home to set the path

  def self.validate_dir
    Dir.mkdir(dir) unless File.exist?(dir)
  end

  def self.dir
    File.join(Configuration.home, today)
  end

  def self.today
    Time.now.strftime("%Y%m%d")
  end

  def self.run(url)
    system(command(url))
  end

  # downloads using the python youtube-dl
  def self.command(url)
    "youtube-dl --write-thumbnail -o \'#{dir}/%(title)s.%(ext)s\' #{url}"
  end

  # creates a html to list up the titles and thumbnails
  def self.gallery
    File.new(File.join(dir, 'gallery.html'), "a+").tap do |file|
      file << "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/></head><body>"
      Dir.glob(File.join(dir, '*.jpg')).each do |image|
        file << "<img src=#{image.gsub(' ', '%20')} width=\"200\">"
        file << "<br>"
        file << "<p>#{File.basename(image, '.jpg')}</p>"
        file << "<br>"
      end
      file << "<body></html>"
    end
  end
end
