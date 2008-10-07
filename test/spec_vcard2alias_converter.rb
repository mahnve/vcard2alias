require 'bacon'
require File.dirname(__FILE__) + '/../lib/vcard2alias_converter'

describe 'vcard to alias converter' do
  before do
    addresses = <<-END
BEGIN:VCARD
VERSION:3.0
N:Usersson;User;;;
FN:User Usersson
EMAIL;type=INTERNET;type=WORK;type=pref:musersson@thoughtworks.com
EMAIL;type=INTERNET;type=HOME:user@usersson.com
item1.EMAIL;type=INTERNET:musersson@gmail.com
item1.X-ABLabel:_$!<Other>!$_
END:VCARD
BEGIN:VCARD
VERSION:3.0
N:Nickman;Nick;;;
FN:Nick Nickman
NICKNAME:Nickname
EMAIL;type=INTERNET;type=HOME;type=pref:nick@nick.com
END:VCARD
BEGIN:VCARD
VERSION:3.0
N:;;;;
FN:Agile Sweden
ORG:Agile Sweden;
EMAIL;type=INTERNET;type=WORK;type=pref:agile@agilesweden.org
EMAIL;type=INTERNET;type=WORK:agile@list.agilesweden.org
END:VCARD
    END

    converter = Vcard2aliasConverter.new
    @result = converter.convert(addresses)
  end

  it 'should start with alias' do
    @result.first[0..4].should.equal 'alias' 
  end

  it 'should create nick from first name, last name and type of email address' do
    @result.first[6..23].should.equal 'user_usersson-work' 
  end

  it 'should choose nickname if available' do
    @result[3][6..18].should.equal 'nickname-home'
  end

  it 'should set up full name if available' do
    @result.first[25..37].should.equal 'User Usersson'
  end

  it 'should add email address' do
    @result.first[39..66].should.equal '<musersson@thoughtworks.com>'
  end

  it 'should handle organizations' do
    @result[4].should.equal 'alias agile_sweden-work Agile Sweden <agile@agilesweden.org>'
  end

end
