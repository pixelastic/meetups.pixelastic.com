module Jekyll
  class DailymotionTag < Liquid::Tag
    def initialize(tag_name, value, tokens)
      super
      video_id = URI.parse(value.strip).path.gsub('video/', '')
      @embed_url = "//www.dailymotion.com/embed/video/#{video_id}"
    end

    def render(_context)
      <<~MARKUP.strip
        <iframe class="dailymotion-player" width="640" height="390" src="#{@embed_url}" frameborder="0" allowfullscreen></iframe>
      MARKUP
    end
  end
end

Liquid::Template.register_tag('dailymotion', Jekyll::DailymotionTag)
