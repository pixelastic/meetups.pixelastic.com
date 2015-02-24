require 'json'
module Jekyll
  class JSONPostGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.posts.each do |post|
        path = post.destination('/')
        path['/index.html'] = '.json'
        
        post.data['original_markdown'] = post.content


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

      # p post.transform
      # p post.data['original_markdow']


      # post_data = post.to_liquid

      # content = {
        # 'id' => post_data['id'],
        # 'title' => post_data['title'],
        # 'url' => site.config['url'] + post_data['id'] + '/',
        # 'tags' => post_data['tags'],
        # 'date' => post_data['date'].to_i,
        # 'html' => post.transform,
        # 'markdown' => post_data['content']
      # }

      self.data = {}
      self.content = JSON.pretty_generate({
        'markdown' => post.data['original_markdown'],
        'html' => post.transform
      })
      # p post.to_liquid
      # p self.content

      process(@name)
    end

    def read_yaml(*)
      # Do nothing
    end

    def render_with_liquid?
      true
    end
  end
end



# post_original = post
# post_transform = post.transform
# post_liquid = post.to_liquid

# p post_liquid
# p post
# p post.transform

# original_markdown = post.data['original_markdown']
# p original_markdown


# # self.data['original_markdown'] = original_markdown
# # self.data['link'] = '[test](test)';
# # self.data['youtube'] = '{% youtube https://www.youtube.com/watch?v=L8w3v9m6G04 %}';
# self.data['post_as_json'] = JSON.pretty_generate({
#   'id' => post_liquid['id'],
#   'title' => post_liquid['title'],
#   'url' => site.config['url'] + post_liquid['id'] + '/',
#   'tags' => post_liquid['tags'],
#   'date' => post_liquid['date'].to_i,
#   'markdown' => original_markdown,
#   'transform' => post_transform,
#   'liquid' => post_liquid
# });
