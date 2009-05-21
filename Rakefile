require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require 'jeweler'



Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

  gem.name        = "rjab"
  gem.summary     = %Q{A Ruby library for interacting with Jabbify.}
  gem.description = %Q{A Ruby library for interacting with Jabbify. Simplifies the process of delivering messages to Jabbify's Comet server.}
  gem.email       = "matt@puchlerz.com"
  gem.homepage    = "http://github.com/mattpuchlerz/rjab"
  gem.authors     = ["Matt Puchlerz"]
  gem.add_dependency 'adamwiggins-rest-client', '>= 0.9.2'  
end



spec_files = FileList['spec/**/*_spec.rb']

desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |task|
  task.spec_opts  = ['--colour --format progress --loadby mtime --reverse']
  task.spec_files = spec_files
end
task :default => :spec

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new(:rcov) do |task|
	task.rcov       = true
  task.spec_opts  = ['--colour --format progress --loadby mtime --reverse']
	task.spec_files = spec_files
end



# require 'rake/rdoctask'
# Rake::RDocTask.new do |rdoc|
#   if File.exist?('VERSION.yml')
#     config = YAML.load(File.read('VERSION.yml'))
#     version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
#   else
#     version = ""
#   end
# 
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title = "rjab #{version}"
#   rdoc.rdoc_files.include('README*')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end