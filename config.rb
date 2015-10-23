###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

with_layout :bloglayout do
  #url = "/blog/*"
  #page "/blog/*", :headers => config[:bloglayout].headers 
end


# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :directory_indexes

activate :blog do |blog|
  blog.permalink = "/{title}/"
  blog.taglink = ":tag/"
  blog.year_link = "{year}/"
  blog.month_link = "{year}/{month}/"
  blog.day_link = "{year}/{month}/{day}/"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  #blog.year_template = "blog/calendar-year.html"
  blog.month_template = "/blog/calendar.html"
  #blog.day_template = "blog/calendar-day.html"
  
  
  blog.layout = "bloglayout"
  
  blog.tag_template = "blog/tag.html"
  blog.paginate = true

  #blog.calendar_template = "blog/calendar.html"

  # This will add a prefix to all links, template references and source paths
   blog.prefix = "blog"

  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.default_extension = ".markdown"

  # Enable pagination
   
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
 helpers do
     def page_or_default(variable)
       current_page.data[variable] || data.site.defaults[variable]
     end

   def is_parent_menu(menuItem)
     dataCount = 0
     if menuItem.key?("url") 
      dataCount = dataCount + 1
    end
     if menuItem.key?("extrahtml") 
      dataCount = dataCount + 1
    end
     return menuItem.count > dataCount
   end

   def landing_page_link
    link = "unset-check-config.rb"
    link = current_page.data["landing_page_link"] || data.site.defaults["landing_page_link"]
    if link.end_with? current_page.path
      link = data.site.defaults["buy_now"]
    end
    return link
   end
 end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
