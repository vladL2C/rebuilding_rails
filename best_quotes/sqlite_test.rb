require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite
end

warn MyTable.schema.inspect

mt = MyTable.create(
  "title" => "I saw it again!",
  "posted" => 44,
  "body" => "it did!"
)

mt["title"] = "I really did!"

mt.save!

mt2 = MyTable.find(mt["id"])

puts "Title: #{mt2["title"]}"
