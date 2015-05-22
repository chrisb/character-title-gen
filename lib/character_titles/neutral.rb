module CharacterTitles
  module Neutral
    module_function
    extend Helpers

    PREFIXES    = %w(byr dy mi beo tyr)
    POSTFIXES   = %w(dren bor dun mar del lad ar gren grad gard born bar bel wren rend mel dar den ful ren)
    ANIMALS     = %w(wolf dragon bear beast)
    PROFESSIONS = %w(guard hunter smith bard fletcher)
    NATURE      = %w(cliff storm wind sand earth)
    ADJECTIVES  = %w(stalwart honest faithful haggard tireless)

    NOUNS = PROFESSIONS + NATURE + ANIMALS

    def first_name
      (PREFIXES.sample + POSTFIXES.sample).titleize_for_character
    end

    def full_name
      "#{first_name} #{surname}".titleize_for_character
    end

    def object
      NOUNS.sample + chance_of(NOUNS, 0.2).to_s
    end

    def prefix
      rand(3) == 1 ? PREFIXES.sample : ''
    end

    def title
      "#{chance_of 'the', 0.2} #{chance_of ADJECTIVES} #{PROFESSIONS.sample} of #{CharacterTitles::Place.generate}".titleize_for_character
    end

    def surname
      (prefix + object + POSTFIXES.sample).titleize_for_character
    end

    def generate_random
      "#{full_name}#{separator}#{one_of title, Evil.generate, Good.generate}"
    end

  end
end
