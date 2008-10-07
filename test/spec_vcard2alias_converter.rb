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
    END

    converter = Vcard2aliasConverter.new
    @result = converter.convert(addresses)
  end

  it 'should create nick from first name, last name and type of email address' do
    @result.first[0..17].should.equal 'user_usersson-work' 
  end

  it 'should choose nickname if available' do
    @result[3][0..12].should.equal 'nickname-home'
  end

  it 'should set up full name' do
    @result.first[19..31].should.equal 'User Usersson'
  end

  it 'should add email address' do
    @result.first[33..58].should.equal 'musersson@thoughtworks.com'
  end

end
