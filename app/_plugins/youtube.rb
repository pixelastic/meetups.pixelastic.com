module Jekyll
  class YoutubeTag < Liquid::Tag
    def initialize(tag_name, value, tokens)
      super
      video_id = CGI.parse(URI.parse(value).query)['v'][0]
      @embed_url = "https://www.youtube.com/embed/#{video_id}"
    end

    def render(_context)
      <<~MARKUP.strip
        <iframe class="youtube-player" type="text/html" width="640" height="390" src="#{@embed_url}" frameborder="0" allowfullscreen></iframe>
      MARKUP
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::YoutubeTag)
