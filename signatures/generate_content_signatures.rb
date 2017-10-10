class GenerateContentSignatures

  keywords = ["passw[a-z0]*d", "pass", "key[s]"]
  # preRegex ="^.*['\"]?"
  # postRegex ="\\s*['\"]?\\s*[=]+\\s*['\"]+.+$"


  keywords.each do |word|
    puts "{"
    puts "\"part\": \"content\","
    puts "\"type\": \"regex\","

    if word.sub("key")
      puts "\"pattern\" : \"^.*['\\"] ? "+word+" \ \ s*['\\"]?\\s*[=]+\\s*[' \ \ "]+.{240,}$\","
    else
      puts "\"pattern\" : \"^.*['\\"] ? "+word+" \ \ s*['\\"]?\\s*[=]+\\s*[' \ \ "]+.+$\","
    end

    puts "\"caption\" : \"Contains #{word}\","
    puts "\"description\" : null"
    puts "},"
  end


end