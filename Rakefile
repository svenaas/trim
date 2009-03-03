require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/trim/version'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'trim'
  s.version          = Trim::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "Gem interface to the URL shortening service tr.im (http://tr.im/)"
  s.author           = 'Sven Aas'
  s.email            = 'sven.aas@gmail.com'
  s.homepage         = 'http://github.com/svenaas/trim/'
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,test}/**/*")
  # s.executables    = ['trim']
  
  # s.add_dependency('gem_name', '~> 0.0.1')
  s.add_dependency('libxml-ruby')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList.new("test/**/*_test.rb") { |fl| fl.exclude /online/ }
  t.verbose = true
end

Rake::TestTask.new("test:online") do |t|
  t.libs << 'test'
  t.test_files = FileList.new("test/**/online_*_test.rb") 
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end