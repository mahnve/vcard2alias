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

  def convert_and_print(input)
    aliases = convert(input).inject do |result, line|
      result << "\n" + line
    end
    puts aliases
  end

  private

  def create_alias_line(nick, location, full_name, email)
    alias_line = "alias "
    alias_line << nick
    alias_line << location
    alias_line << full_name
    alias_line << ' ' 
    alias_line << '<' + email + '>'
  end

  def full_name(card)
    card.name.fullname ? " " + card.name.fullname : ""
  end

  def get_location(email)
    '-' <<  (email.location.first ? email.location.first : 'other')
  end

  def create_nick(card)
    nick = card.nickname ? card.nickname.downcase : fullname_appended(card)
  end

  def fullname_appended(card)
    card.name.fullname.gsub(/\s/,'_').downcase
  end

end
