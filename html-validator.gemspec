Gem::Specification.new do |s|
  s.name        = "html-validator"
  s.version     = '0.1.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TeamIguana"]
  s.summary     = 'Assertions to validate an html document'
  s.homepage    = 'https://github.com/TeamIguana/html-validator'

  s.add_runtime_dependency('rake')
  s.add_runtime_dependency('test-unit')
  s.add_runtime_dependency('nokogiri')


  s.files        = Dir.glob("{lib}/**/*.rb") + Dir.glob("{schemas}/**/*.*")
  s.require_paths = ['lib']
end