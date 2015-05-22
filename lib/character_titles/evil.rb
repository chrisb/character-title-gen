module CharacterTitles
  module Evil
    module_function
    extend Helpers

    SILLY = false

    BODY_PARTS_SINGULAR    = %w(anus blood flesh skin fat death eye sight)
    BODY_PARTS             = %w(intestine colon gonad skull leg arm body head gut beast heart liver)
    VIOLENT_VERBS_AS_NOUNS = %w(vommitter cooker roaster punisher mutalator disfigurer clawer disembowler crusher masher ravisher banisher killer grasper tearer flayer eater ripper impaler chewer sucker severer wrencher sapper reamer walker feaster devourer destroyer tormentor defiler mincer)
    ADJECTIVES             = %w(evil dark rotting putrid forgotten terrible horrible nasty sickening putrifying banished outlawed)
    NOUNS                  = %w(scourage terror horror ghoul ghost beast outlaw criminal demon)

    def qualifier
      "#{chance_of 'the'} #{NOUNS.sample} of #{CharacterTitles::Place.generate}"
    end

    def descriptor
      body_part = (BODY_PARTS_SINGULAR + BODY_PARTS).sample
      singular  = BODY_PARTS_SINGULAR.include? body_part

      !singular && rand(2) == 1 ?
        "#{VIOLENT_VERBS_AS_NOUNS.sample} of #{body_part.pluralize}" :
        "#{body_part}#{word_separator}#{VIOLENT_VERBS_AS_NOUNS.sample}"
    end

    def generate
      [chance_of('the'), chance_of(ADJECTIVES), descriptor, chance_of(", #{qualifier}", 0.5)].compact.join(' ').titleize_for_character
    end
  end
end
