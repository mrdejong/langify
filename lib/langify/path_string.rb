class Langify::PathString
  def self.to_path_hash(path)
    paths = path.split(':')
    {
      locale: paths[0],
      file: paths[1],
      path: paths[2]
    }
  end

  def self.to_key_array(path)
    path.split('.')
  end
end
