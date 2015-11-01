require 'pry'

class Langify::SaveYaml
  def initialize(path_hash, str, existing_hash = {})
    @locale_path = "#{Dir.pwd}/tmp/config/locale"
    @file_name = "#{path_hash[:lang]}_#{path_hash[:file]}.yml"
    @lang = path_hash[:lang].to_sym
    @lang_key = path_hash[:path]
    @str = str
    if existing_hash.empty?
      existing_hash[@lang] = {}
    end
    @existing = existing_hash
  end

  def get_file
    @file_name
  end

  def exists?
    File.exists? "#{@locale_path}/#{@file_name}"
  end

  def to_hash
    hash = @existing
    keys = Langify::PathString.to_key_array(@lang_key)
    hash[@lang] = insert_new_key(keys, hash[@lang], @str)
    hash
  end

  private
    def insert_new_key(keys, hash, value)
      if keys.any?
        key = keys.first
        keys.delete(key)

        if keys.length > 0
          if hash[key.to_sym].nil?
            hash[key.to_sym] = { }
          end
          insert_new_key(keys, hash[key.to_sym], value)
        else
          hash[key.to_sym] = value
        end
      end
      hash
    end
end
