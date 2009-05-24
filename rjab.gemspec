# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rjab}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Puchlerz"]
  s.date = %q{2009-05-23}
  s.description = %q{A Ruby library for interacting with Jabbify. Simplifies the process of delivering messages to Jabbify's Comet server.}
  s.email = %q{matt@puchlerz.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/jabbify.rb",
     "lib/jabbify/comet.rb",
     "rjab.gemspec",
     "spec/jabbify/comet_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/mattpuchlerz/rjab}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{A Ruby library for interacting with Jabbify.}
  s.test_files = [
    "spec/jabbify/comet_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
    else
      s.add_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
    end
  else
    s.add_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
  end
end
