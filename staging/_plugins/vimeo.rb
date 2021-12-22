require 'uri'
require 'cgi'

module Jekyll
  module Tags
    class VimeoTag < Liquid::Block
      puts "I AM HERE"
      def initialize(tag_name, markup, tokens)
        super
        input = input.strip
        @vimeo_id = URI.parse(input).path
        @embed_url = "//player.vimeo.com/video#{@vimeo_id}"
      end

      def render(_context)
        <<~MARKUP.strip
          <iframe class="vimeo-player" width="640" height="390" src="#{@embed_url}" frameborder="0" allowfullscreen></iframe>
        MARKUP
      end
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::Tags::VimeoTag)
