Gem::Specification.new do |s|
  s.name     = "vcard2alias"
  s.version  = "0.2"
  s.date     = "2008-10-07"
  s.summary  = "Converts vcard file to mutt alias format"
  s.email    = "marcus@ahnve.com"
  s.homepage = "http://github.com/mahnve/vcard2alias"
  s.description = "With a file of vcards, convert all cards to mutt alias format"
  s.has_rdoc = false
  s.authors  = ["Marcus Ahnve"]
  s.files    = [
"History.txt",
"Manifest.txt",
"README.txt",
"Rakefile",
"bin/vcard2alias",
"lib/vcard2alias.rb",
"lib/vcard2alias_converter.rb" ]
  s.test_files = ["test/spec_vcard2alias_converter.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("vpim", ["> 0.0.0"])
end
