Gem::Specification.new do |s|
  s.name          = 'refile-input'
  s.license       = 'MIT'
  s.version       = '0.0.3'
  s.authors       = ["Petr Sergeev", "Sindre Moen"]
  s.email         = ["peter@hyper.no", "sindre@hyper.no"]
  s.description   = "This adds custom input to support refile file uploader to formtastic form builder"
  s.summary       = "Refile input type for formtastic"
  s.homepage      = "https://github.com/hyperoslo/refile-input"

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")

  s.add_dependency 'formtastic', '~> 3.1'
  s.add_dependency 'refile', '~> 0.5'
end
