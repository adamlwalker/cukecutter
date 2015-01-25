Gem::Specification.new do |s|
  s.name        = 'cukecutter'
  s.version     = '0.0.6'
  s.date        = '2014-12-27'
  s.summary     = "CukeCutter cucumber generator"
  s.description = "Cucumber feature and step definition tool automated generator. CLI"
  s.authors     = ["Adam Walker"]
  s.email       = 'adamlwalker77@gmail.com'
  s.files       = ["lib/cukecutter.rb"]
  s.metadata	= { "issue_tracker" => "https://github.com/adamlwalker/cukecutter/issues" }
  s.homepage	= 'https://github.com/adamlwalker/cukecutter'
  s.license       = 'MIT'
  s.add_dependency 'cucumber', '>= 0.7.5'
  s.executables   = ["cutcuke"]
end