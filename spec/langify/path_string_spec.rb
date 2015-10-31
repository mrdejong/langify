require 'spec_helper'

describe Langify::PathString do
  it 'should generate a hash from a string' do
    result = Langify::PathString.to_path_hash('nl:profile:username')

    expect(result.class).to eq(Hash)
  end

  it 'should generate a hash with the keys: [locale,file,path]' do
    result = Langify::PathString.to_path_hash('nl:profile:username')

    expect(result.keys).to eq([:locale, :file, :path])
  end

  it 'should generate an array from a string' do
    result = Langify::PathString.to_key_array('page.profile.title')

    expect(result.class).to eq(Array)
    expect(result.length).to eq(3)
  end
end
