module CharacterTitle
  module Place
    module_function

    ADJECTIVES = %w(northern southern western eastern cold wintery snowy rugged dark crimson red bloody haunted)
    MODIFIERS  = %w(world land realm)
    PLACES     = %w(winter plains south east north west caves caverns towers)
    PLACES_NEEDING_MODIFIER = %w(under over hinter grass water wet)

    def should_modify?
      rand(3) == 1
    end

    def should_be_proper?
      rand(4) != 1
    end

    def should_add_adjective?
      rand(3) == 1
    end

    def place_with_modifier
      PLACES_NEEDING_MODIFIER.sample + MODIFIERS.sample
    end

    def place_name
      PLACES.sample
    end

    def generate
      place = should_modify? ? place_with_modifier : place_name
      place = "#{place_adjectives.sample} #{place}" if should_add_adjective?
      "#{'the' if should_be_proper?} #{place}".strip
    end
  end
end
