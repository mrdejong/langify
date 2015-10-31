class Langify::SaveYaml
  def initialize(path_hash, str)
    @locale_path = "#{Dir.pwd}/tmp/config/locale"
    @file_name = "#{path_hash[:lang]}_#{path_hash[:file]}.yml"
    @lang = path_hash[:lang].to_sym
    @lang_key = path_hash[:path].to_sym
    @str = str
  end

  def get_file
    @file_name
  end

  def exists?
    File.exists? "#{@locale_path}/#{@file_name}"
  end

  def to_hash
    hash = { }
    hash[@lang] = { }
    hash[@lang][@lang_key] = @str
    hash
  end
end
