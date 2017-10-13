class GenerateContentSignatures

  keywords = ["key[s]?", "passw[a-z0]*d", "pass", "pw", "passkey", "secret", "cred[s]?", "credential[s]?", "pem", "p12"]
  # preRegex ="^.*['\"]?"
  # postRegex ="\\s*['\"]?\\s*[=]+\\s*['\"]+.+$"

  #"" Creds after = in '' or ""
  keywords.each do |word|
    puts "{"
    puts "\"part\": \"content\","
    puts "\"type\": \"regex\","

    if word.include? "key"
      puts '"pattern": "^.*[\'\"]?'+word+'\\\s*[\'\"]?\\\s*[=]+\\\s*[\'\"]+\\\S{240,}[\'\"]+",'
    else
      puts '"pattern": "^.*[\'\"]?'+word+'\\\s*[\'\"]?\\\s*[=]+\\\s*[\'\"]+.+[\'\"]+",'
    end

    puts "\"caption\" : \"Contains #{word}\","
    puts "\"description\" : null"
    puts "},"
  end


  #"" Creds after : in json like files
  keywords.each do |word|
    puts "{"
    puts "\"part\": \"content\","
    puts "\"type\": \"regex\","
    puts "\"extension_pattern\": \"json|yaml|yml|conf|config\","

    if word.include? "key"
      puts  '"pattern": "^.*'+word+'\\\s*[:]\\\s*\\\S{240,}$",'
    else
      puts  '"pattern": "^.*'+word+'\\\s*[:]\\\s*.+$",'
    end

    puts "\"caption\" : \"Contains #{word}\","
    puts "\"description\" : null"
    puts "},"
  end



end