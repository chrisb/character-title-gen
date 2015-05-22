module CharacterTitles
  module Good
    module_function
    extend Helpers

    NOUNS               = %w(light wonder prosperity goodness truth)
    VERBS_AS_NOUNS      = %w(bringer restorer bearer guardian savior protector)
    ANTI_VERBS_AS_NOUNS = %w(vanquisher slayer destroyer cleanser healer remover)

    def qualifier
      "#{chance_of 'the'}#{ANTI_VERBS_AS_NOUNS.sample} of #{ CharacterTitles::Evil::NOUNS.sample.pluralize}"
    end

    def title
      "#{chance_of 'the'} #{NOUNS.sample}#{chance_of '-', 0.5}#{VERBS_AS_NOUNS.sample}"
    end

    def generate
      "#{title} #{chance_of qualifier, 0.5}".titleize_for_character
    end

  end
end
