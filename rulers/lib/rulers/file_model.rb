require "multi_json"

module Rulers
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename
        # If filename is "dir/37.json", @id is 37
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, vale)
        @hash[name.to_s] = value
      end

      def self.find(id)
        FileModel.new("db/quotes/#{id}.json")
      rescue
        nil
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new(f) }
      end

      def self.create(attrs)
        hash = {
          "submitter" => attrs.fetch("submitter", ""),
          "quote" => attrs.fetch("quote", ""),
          "attribution" => attrs.fetch("attribution", "")
        }

        files = Dir["db/quotes/*.json"]
        names = files.map { |f| File.split(f).last }
        highest = names.map(&:to_i).max
        id = highest + 1

        File.write("db/quotes/#{id}.json", JSON.pretty_generate(hash))

        FileModel.new("db/quotes/#{id}.json")
      end

      def self.where(attributes = {})
        all.select { |model| attributes.all? { |k, v| model[k] == v } }
      end
    end
  end
end
