class Substrings
  def call(str, dictionary)
    str_arr = str.downcase.split("")
    substrings = {}
    dictionary.each do |substring|
      substring_arr = substring.split("")
      str_arr.each_with_index do |letter, i|
        if letter == substring[0]
          if substring == str_arr[i..i+substring.length-1].join
            if substrings[substring].nil?
              substrings[substring] = 1
            else
              substrings[substring] += 1
            end
          end
        end
      end
    end
    substrings
  end

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p Substrings.new.call("Howdy partner, sit down! How's it going?", dictionary)
