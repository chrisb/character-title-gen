require 'active_support/all'

require 'character_titles/version'

require 'character_titles/helpers'

require 'character_titles/place'
require 'character_titles/evil'
require 'character_titles/good'
require 'character_titles/neutral'

class String
  def titleize_for_character
    self.strip.titleize.gsub('Of', 'of').gsub('The', 'the').gsub(' , ', ', ')
  end
end
