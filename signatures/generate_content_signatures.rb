class GenerateContentSignatures

  keywords = ["passw[a-z0]*", "pass", "pw", "passkey", "secret", "cred[s]?", "credential[s]?", "pem", "p12", "key[s]?"]

  #"" Creds after = in '' or ""
  keywords.each do |word|
    puts "{"
    puts "\"part\": \"content\","
    puts "\"type\": \"regex\","

    if word.include? "key"
      puts '"pattern": "[\'\"]?[a-z0]*'+word+'\\\s*[\'\"]?\\\s*[=]+\\\s*[\'\"]+\\\S{240,}[\'\"]+",'
    else
      puts '"pattern": "[\'\"]?[a-z0]*'+word+'\\\s*[\'\"]?.*[=]+\\\s*[\'\"]+.+[\'\"]+",'
    end

    puts "\"caption\" : \"Contains #{word} after equal sign\","
    puts "\"description\" : null"
    puts "},"
  end


  #"" Creds after : in json like files
  # test in http://rubular.com/r/2bSdKueG1j
  keywords.each do |word|
    puts "{"
    puts "\"part\": \"content\","
    puts "\"type\": \"regex\","
    puts "\"extension_pattern\": \"json|yaml|yml|conf|config\","

    if word.include? "key"
      puts  '"pattern": "^.*'+word+'\\\s*[:]{1}\\\s*\\\S{240,}$",'
    else
      puts  '"pattern": "^.*'+word+'\\\s*[:]{1}\\\s*.+$",'
    end

    puts "\"caption\" : \"Contains #{word} after colon\","
    puts "\"description\" : null"
    puts "},"
  end



end