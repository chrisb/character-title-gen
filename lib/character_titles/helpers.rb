module CharacterTitles
  module Helpers
    module_function

    def one_of(*args)
      args.sample
    end

    def chance_of(obj, chance = 0.3)
      obj = obj.sample if obj.is_a?(Array)
      rand < chance ? obj : nil
    end

    def word_separator
      ['', '-', ' '].sample
    end

    def separator(include_none = false)
      [', ', ' - ', ': '].concat(include_none ? [''] : []).sample
    end


  end
end
