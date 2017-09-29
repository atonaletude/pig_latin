require 'pry'
class PigLatin
  VOWEL_SOUNDS =  ['xr','yt']
  CONSANANT_SOUNDS = ['yt','thr','qu','sch','th','ch']

  def self.translate(regular_word)
    if vowel?(regular_word)
      regular_word += 'ay'

    elsif preceding_qu?(regular_word)
      new_word = regular_word.sub(/\w*u/,'')
      suffix = regular_word.chars - new_word.chars
      new_word + suffix.join + 'ay'
      # puts 'yes'
    elsif special_consonant?(regular_word)
      word_clone = regular_word.clone
      CONSANANT_SOUNDS.each do |sub_string|
        if regular_word.match?(/#{sub_string}/)
        word_clone = word_clone.sub(/#{sub_string}/, '') + sub_string
        break
      end
      end
      word_clone + 'ay'
    elsif consonant?(regular_word)
      regular_word += regular_word[0] + 'ay'
      regular_word.split('').drop(1).join
    end
  end

  def self.vowel?(regular_word)
    regular_word[0].match(/[aeiou]/) ||
      VOWEL_SOUNDS.include?(regular_word[0..1])
  end

  def self.consonant?(regular_word)
    regular_word[0].match(/[^aeiou]/)
  end

  def self.special_consonant?(regular_word)
    flag = false
    CONSANANT_SOUNDS.each do |sub_string|
      flag = true  if regular_word.match?(/#{sub_string}/)
    end
    flag
  end

  def self.preceding_qu?(regular_word)
    return true if regular_word.match?(/[^aeiou]qu/) && regular_word[1] != 'u'
  end

end

p PigLatin.translate('sqaure')
