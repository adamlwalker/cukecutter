Gem::Specification.new do |s|
  s.name        = 'cukecutter'
  s.version     = '0.0.5'
  s.date        = '2014-12-22'
  s.summary     = "CukeCutter cucumber generator"
  s.description = "Cucumber feature and step definition tool automated generator. CLI"
  s.authors     = ["Adam Walker"]
  s.email       = 'adamlwalker77@gmail.com'
  s.files       = ["lib/cukecutter.rb"]
  s.extra_rdoc_files	= ['doc/user-guide.txt']
  s.metadata	= { "issue_tracker" => "https://github.com/adamlwalker/cukecutter/issues" }
  s.homepage	= 'https://github.com/adamlwalker/cukecutter'
  s.license       = 'MIT'
  s.add_dependency 'cucumber'
end