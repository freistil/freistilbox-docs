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

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Use redcarpet as Markdown engine
set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, gh_blockcode: true, fenced_code_blocks: true, with_toc_data: true, smartypants: true

# Use rouge for syntax highlighting
activate :rouge_syntax

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'docs.freistilbox.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'eu-west-1'     # The AWS region for your bucket.
  #s3_sync.aws_access_key_id          = 'AWS KEY ID'
  #s3_sync.aws_secret_access_key      = 'AWS SECRET KEY'
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
end

# Sitemap for search engines
set :url_root, 'http://docs.freistilbox.com'
activate :search_engine_sitemap

helpers do
  def section_list(section)
    output = ""
    parent = Regexp.new "#{section}"
    sitemap.resources.each do |resource|
      next if resource.url !~ parent || resource.ext != '.html' || resource == current_resource
      output << "<li><a href=\"#{resource.url}\">#{resource.data.title}</a></li>"
    end
    output
  end

  def related_pages(tags)
    return [] if tags.nil?

    pages = []
    tags.each do |tag|
      pages |= sitemap.where(:tags.include => tag).all
    end

    pages - [current_page]
  end

  def support_link(text)
    link_to text, "/important_details/support.html"
  end
end
