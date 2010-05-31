# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{msg-chumby-display}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mathias Dalheimer"]
  s.date = %q{2010-05-31}
  s.default_executable = %q{msg-chumby-daemon}
  s.description = %q{The mySmartGrid project provides means to manage your household energy consumption. This gem provides the runtime environment for the Chumby: it queries the mySmartGrid webservice and forwards that information to a Flash application running on the Chumby.}
  s.email = %q{md@gonium.net}
  s.executables = ["bin/gserver.rb", "bin/msg-chumby-daemon", "bin/simple-mongrel.rb"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/gserver.rb",
     "bin/msg-chumby-daemon",
     "bin/simple-mongrel.rb",
     "lib/msg-chumby-daemon.rb",
     "lib/msg-chumby-display.rb",
     "test/helper.rb",
     "test/test_msg-chumby-display.rb"
  ]
  s.homepage = %q{http://github.com/gonium/msg-chumby-display}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Displays various information from the mySmartGrid project on your Chumby}
  s.test_files = [
    "test/helper.rb",
     "test/test_msg-chumby-display.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<flukso4r>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<daemons>, [">= 1.0.10"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<flukso4r>, [">= 0.3.1"])
      s.add_dependency(%q<daemons>, [">= 1.0.10"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<flukso4r>, [">= 0.3.1"])
    s.add_dependency(%q<daemons>, [">= 1.0.10"])
  end
end
