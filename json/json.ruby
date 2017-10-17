require 'json'
tempHash = {
    "key_a" => "val_a",
    "key_b" => "val_b"
}
File.open("public/input.json","w") do |f|
  f.write(tempHash.to_json)
end
