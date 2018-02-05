require 'uri'
require 'cgi'

module Jekyll
  # Rendering {% dailymotion %} tags
  class DailyMotionTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      input = input.strip
      @video_id = URI.parse(input).path.gsub('video/', '')
      @embed_url = "//www.dailymotion.com/embed/video/#{@video_id}"
    end

    def render(_context)
      %(<iframe
          class="dailymotion-player"
          width="640"
          height="390"
          src="#{@embed_url}"
          frameborder="0"
          allowfullscreen></iframe>
        )
    end
  end

  # Rendering {% vimeo %} tags
  class VimeoTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      input = input.strip
      @vimeo_id = URI.parse(input).path
      @embed_url = "//player.vimeo.com/video#{@vimeo_id}"
    end

    def render(_context)
      %(<iframe
            class="db mha"
            width="640"
            height="390"
            src="#{@embed_url}"
            frameborder="0" allowfullscreen></iframe>
      )
    end
  end

  # Rendering {% youtube %} tags
  class YoutubeTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      input = input.strip!
      @youtube_id = CGI.parse(URI.parse(input).query)['v'][0]
      @embed_url = "http://www.youtube.com/embed/#{@youtube_id}"
    end

    def render(_context)
      %(<iframe
          class="youtube-player"
          type="text/html"
          width="640"
          height="390"
          src="#{@embed_url}"
          frameborder="0" allowfullscreen></iframe>
        )
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::VimeoTag)
Liquid::Template.register_tag('dailymotion', Jekyll::DailyMotionTag)
Liquid::Template.register_tag('youtube', Jekyll::YoutubeTag)
