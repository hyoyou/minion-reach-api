require 'csv'

filename = File.join Rails.root, "public/words.csv"
task :import_words => :environment do 
    CSV.read(filename, headers: true).each do |row|
        word = row[0]
        difficulty = row[1]
        word = Word.create(word: word, difficulty: difficulty)
        # puts "#{word.errors.full_messages.join(", ")}" if word.errors.any?
    end
end