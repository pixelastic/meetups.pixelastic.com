require 'json'
module Jekyll
  class JSONPostGenerator < Generator
    safe true
    priority :low

    def convert_liquid_tags(content)
      info = { :filters => [Jekyll::Filters] }
      return Liquid::Template.parse(content).render!({}, info);
    end

    def generate(site)
      site.posts.each do |post|
        post.data['json'] = {}

        # Getting raw content
        post.data['json']['markdown'] = convert_liquid_tags(post.content)
        # Passing it to html
        post.transform
        post.data['json']['html'] = convert_liquid_tags(post.content)

        # Getting more data from the post
        liquid_data = post.to_liquid
        post.data['json']['id'] = liquid_data['id']
        post.data['json']['title'] = post.data['title']
        post.data['json']['url'] = "#{site.config['url']}#{liquid_data['id']}/"
        post.data['json']['tags'] = liquid_data['tags']
        post.data['json']['date'] = liquid_data['date'].to_i

        # Save in same path, but with json extension
        path = post.destination('/')
        path['/index.html'] = '.json'

        json_page = JSONPage.new(site, path, post)
        json_page.render(site.layouts, site.site_payload)
        json_page.write(site.dest)
        site.pages << json_page
      end
    end
  end

  class JSONPage < Page
    def initialize(site, path, post)
      @site = site
      @base = site.source
      @dir  = File.dirname(path)
      @name = File.basename(path)

      self.data = {}
      self.content = JSON.pretty_generate(post.data['json'])

      process(@name)
    end
  end
end
