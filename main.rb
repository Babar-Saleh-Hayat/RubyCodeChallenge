require 'yaml'
require './analysis'

# Add new language .yaml files in lang folder and their heading in this Hash
headings = {
  'EN' => 'Analysis Results',
  'FR' => 'Les résultats d\'analyse',
  'ES' => 'Analüüsi tulemused'
}

# initialize new empty array
lang_data = Array.new { [] }

# read language files in lang directory
lang_files = Dir.glob("./lang/*.yaml")
lang_files.each do |file|

  # read file and get data in raw
  raw_config = YAML.load_file(file)
  # extract language initials and capitalize them
  lang = file[7..8].upcase
  # Get Analysis results of the file
  results = raw_config.map do |item|
    Analysis.new(id: item['id'], title: item['title'], reasons: item['reasons'], lang: lang)
  end
  # push results in lang_data array
  lang_data.push(results)
end

# Flatten the array to single level and
# group them by id, which is unique in all languages
# loop over newly created groups and
# print each item on STDOUT
lang_data
  .flatten
  .group_by { |g| g.id }
  .each do |_, results|
  results.each do | item|
    puts "(#{item.lang}) #{headings[item.lang]}"
    puts '================'
    puts "Analysis ID: #{item.id}"
    puts "Analysis Title: #{item.title}"
    puts 'Analysis Reasons:'
    item.reasons.each do |reason|
      puts "  - #{reason.title}: #{reason.description}"
    end
    puts "---------- \n\n"
  end
end

