task :default => :build

desc "Build the website from source"
task :build do
  puts "## Building website"
  sh "bundle exec middleman build --clean"
end

desc "Run the preview server at http://localhost:4567"
task :preview do
  sh "bundle exec middleman server"
end

desc "Deploy website to S3"
task :deploy => :build do
  sh "bundle exec middleman s3_sync"
end

desc "Deploy from CI system"
task :cideploy => :build do
  sh "aws s3 rm s3://docs.freistilbox.com --recursive"
  sh "aws s3 sync build s3://docs.freistilbox.com --region eu-west-1 --acl public-read --cache-control \"public, max-age=86400\""
end
