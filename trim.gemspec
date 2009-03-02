# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{trim}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Aas"]
  s.date = %q{2009-03-01}
  s.email = %q{sven.aas@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/trim", "lib/trim/version.rb", "lib/trim.rb", "test/test_helper.rb", "test/unit", "test/unit/trim_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/svenaas}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Gem interface to the URL shortening service, tr.im (http://tr.im/)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
