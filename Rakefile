require 'rubygems'
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

begin
  require 'yard'

  YARD::Rake::YardocTask.new(:doc) do |t|
    t.files = ['lib/**/*.rb']
    static_files = 'LICENSE'
    t.options += [
      '--title', 'FIDIUS Common libraries',
      '--private',   # include private methods
      '--protected', # include protected methods
      '--files', static_files,
      '--readme', 'README.md'
    ]
  end
rescue LoadError
  puts 'YARD not installed (gem install yard), http://yardoc.org'
end
