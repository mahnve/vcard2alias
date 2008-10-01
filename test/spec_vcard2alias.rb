require 'bacon'
require File.dirname(__FILE__) + '/../lib/vcard2alias_converter'

describe 'vcard to alias converter' do
  it 'should convert one adress' do
    one_address = <<-END

    END

    converter = Vcard2aliasConverter.new
    result = converter.convert(one_address)
    result.should.equal 'user_usersson User Usersson user@usersson.com' 
  end
end
