require 'uri'
require 'cgi'

module Jekyll
  class VimeoTag < Liquid::Tag

    def initialize(tag_name, input, tokens)
      super
      input.chomp!
      @vimeo_id = URI.parse(input).path
      @embed_url = "//player.vimeo.com/video#{@vimeo_id}"
    end

    def render(context)
      return "<iframe 
class=\"vimeo-player\"
width=\"640\" 
height=\"390\"
src=\"#{@embed_url}\"
frameborder=\"0\"
allowfullscreen
></iframe>"
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::VimeoTag)


