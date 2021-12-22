require 'awesome_print'
module Jekyll
  class VimeoTag < Liquid::Tag

    def initialize(tag_name, value, tokens)
      super
      vimeo_id = URI.parse(value.strip).path
      @embed_url = "//player.vimeo.com/video#{vimeo_id}"
    end

    def render(_context)
      <<~MARKUP.strip
        <iframe class="vimeo-player" width="640" height="390" src="#{@embed_url}" frameborder="0" allowfullscreen></iframe>
      MARKUP
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::VimeoTag)

