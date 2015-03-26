require 'uri'
require 'cgi'

module Jekyll
  class DailyMotionTag < Liquid::Tag

    def initialize(tag_name, input, tokens)
      super
      input.chomp!
      @video_id = URI.parse(input).path.gsub('video/', '')
      @embed_url = "//www.dailymotion.com/embed/video/#{@video_id}"
    end

    def render(context)
        <<MARKUP.strip
<iframe class="dailymotion-player" width="640" height="390" src="#{@embed_url}" frameborder="0" allowfullscreen></iframe>
MARKUP
    end
  end
end

Liquid::Template.register_tag('dailymotion', Jekyll::DailyMotionTag)


