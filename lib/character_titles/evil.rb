require 'active_support/all'

module CharacterTitles
  module Evil
    module_function

    BODY_PARTS_SINGULAR    = %w(anus blood flesh skin fat death eye sight)
    BODY_PARTS             = %w(intestine colon gonad skull leg arm body head gut beast heart liver)
    VIOLENT_VERBS_AS_NOUNS = %w(vommitter cooker roaster punisher mutalator disfigurer clawer disembowler crusher masher ravisher banisher killer grasper tearer flayer eater ripper impaler chewer sucker severer wrencher sapper reamer walker feaster devourer destroyer tormentor defiler mincer)
    ADJECTIVES             = %w(evil dark rotting putrid forgotten terrible horrible nasty sickening putrifying banished outlawed)
    NOUNS                  = %w(scourage terror horror ghoul ghost beast outlaw criminal demon)

    def qualifer_should_be_proper?
      rand(3) == 1
    end

    def qualifier
      "#{'the ' if qualifer_should_be_proper?}#{NOUNS.sample} of #{CharacterTitles::Place.generate}"
    end

    def pick_body_part
      (BODY_PARTS_SINGULAR + BODY_PARTS).sample
    end

    def generate
      body_part = pick_body_part

      title = if rand(2) == 1 && !BODY_PARTS_SINGULAR.include?(body_part)
        "#{VIOLENT_VERBS_AS_NOUNS.sample} of #{body_part.pluralize}"
      else
        "#{body_part}#{['', '-', ' '].sample}#{VIOLENT_VERBS_AS_NOUNS.sample}"
      end

      title = "#{ADJECTIVES.sample} #{title}" if rand(3) == 1 # add an adjective to the title?
      title = "the #{title}"                  if rand(3) == 1 # should the title be proper?
      title = "#{title}, #{qualifier}"        if rand(2) == 1 # should it include a qualifier?

      title.titleize.gsub('Of', 'of').gsub('The', 'the')
    end
  end
end
