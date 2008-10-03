require 'bacon'
require File.dirname(__FILE__) + '/../lib/vcard2alias_converter'

describe 'vcard to alias converter' do
  it 'should convert one adress' do
    one_address = <<-END
BEGIN:VCARD
VERSION:3.0
N:Usersson;User;;;
FN:User Usersson
ORG:ThoughtWorks;
EMAIL;type=INTERNET;type=WORK;type=pref:musersson@thoughworks.com
EMAIL;type=INTERNET;type=HOME:user@usersson.com
item1.EMAIL;type=INTERNET:musersson@gmail.com
item1.X-ABLabel:_$!<Other>!$_
TEL;type=WORK:+46 8 5500 2101
TEL;type=CELL:+46 734 400 545
TEL;type=HOME;type=pref:+46 8 30 81 44
TEL;type=WORK;type=FAX:+46 8 5500 2119
item2.ADR;type=WORK:;;Mäster Samuelsgatan 60\, 8tr.;Stockholm;;111 21;Sweden
item2.X-ABADR:se
item3.ADR;type=HOME;type=pref:;;Buvagen 92;Bromma;Stockholm;164 52;Sweden
item3.X-ABADR:se
item4.URL;type=pref:http\://user.usersson.net
item4.X-ABLabel:_$!<HomePage>!$_
BDAY;value=date:1969-11-08
X-JABBER;type=HOME;type=pref:musersson@gmail.com
X-JABBER;type=HOME:user@usersson.com
X-MSN;type=HOME;type=pref:cbr83@hotmail.com
X-YAHOO;type=HOME;type=pref:usersson
X-YAHOO-ID;type=HOME;type=pref:usersson
X-ICQ;type=HOME;type=pref:4564879
X-ABUID:8007FFAC-F1AC-4B22-AF14-01D8F072704A\:ABPerson
END:VCARD
    END

    converter = Vcard2aliasConverter.new
    result = converter.convert(one_address)
    result.should.equal 'user_usersson User Usersson user@usersson.com' 
  end
end
