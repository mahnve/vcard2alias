require 'vpim/vcard'

class Vcard2aliasConverter
  def convert(input)
    result = []
    cards = Vpim::Vcard.decode(input)
    cards.each do |card|
      nick = create_nick(card)
      full_name = full_name(card)
      card.emails.each do |email|
        location = get_location(email)
        result << create_alias_line(nick, location, full_name, email)
      end
    end
    result
  end

  private

  def create_alias_line(nick, location, full_name, email)
    alias_line = ""
    alias_line << nick
    alias_line << location
    alias_line << " "
    alias_line << full_name
    alias_line << ' ' 
    alias_line << email
  end

  def full_name(card)
    card.name.given + " " + card.name.family
  end

  def get_location(email)
    '-' <<  (email.location.first ? email.location.first : 'other')
  end

  def create_nick(card)
    nick = card.nickname ? card.nickname.downcase : first_and_lastname_joined(card)
  end

  def first_and_lastname_joined(card)
      nick = ""
      nick << card.name.given
      nick << "_"
      nick << card.name.family
      nick.downcase
  end
    
end
