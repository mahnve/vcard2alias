require 'vpim/vcard'

class Vcard2aliasConverter
  def convert(input)
    card = Vpim::Vcard.decode(input).first
    alias_line = ""
    alias_line << create_nick(card)
    alias_line << " "
    alias_line << card.name.given
    alias_line << " "
    alias_line << card.name.family
    alias_line << ' ' 
    alias_line << card.email('HOME')
    alias_line
  end

  private

  def create_nick(card)
    nick = ""
    nick << card.name.given
    nick << "_"
    nick << card.name.family
    nick.downcase
  end
    
end
