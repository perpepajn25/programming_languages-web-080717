require "pry"

def reformat_languages(languages)
  hash = style_oo_language(languages).merge(style_functional_language(languages)) {|key,v1,v2| v1}
  hash.map do |language,data|
    if oo_languages(languages).include?(language) && functional_languages(languages).include?(language)
      data[:style] = [:oo,:functional]
      {language => data}
    elsif oo_languages(languages).include?(language)
      data[:style] = [:oo]
      {language => data}
    elsif functional_languages(languages).include?(language)
      data[:style] = [:functional]
      {language => data}
    end
  end
  return hash
end


def style_oo_language(languages)
  languages[:oo]
end

def style_functional_language(languages)
  languages[:functional]
end

def oo_languages(languages)
  languages[:oo].keys
end

def functional_languages(languages)
  languages[:functional].keys
end
