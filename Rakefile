begin
  require "jeweler"

  Jeweler::Tasks.new do |gem|
    gem.name = "resque-timer"
    gem.version = "0.1"
    gem.summary = "Calculates a job's execution time."
    gem.email = "brett@intraspirit.net"
    gem.homepage = "http://github.com/brettbuddin/resque-timer"
    gem.date = Time.now.strftime('%Y-%m-%d')
    gem.authors = ["Brett Buddin"]
    gem.files = %w( README.md Rakefile LICENSE )
    gem.files += Dir["*", "{lib}/**/*"]

    gem.has_rdoc = false
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
