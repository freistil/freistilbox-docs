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
task :deploy do
  sh "bundle exec middleman s3_sync"
end

#desc "Build and deploy website"
#task :gen_deploy => [:build, :deploy] do
#end
