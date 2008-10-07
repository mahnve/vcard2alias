# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/vcard2alias.rb'

Hoe.new('vcard2alias', Vcard2alias::VERSION) do |p|
  # p.rubyforge_name = 'vcard2aliasx' # if different than lowercase project name
  p.developer('Marcus Ahnve', 'marcus@ahnve.com')
end

desc "Run all the fast tests"
task :test do
  `bacon -Ilib --automatic --quiet test/*.rb`
end

