require 'spec_helper'
require 'langify/save_yaml'

describe Langify::SaveYaml do
  let(:yml) { Langify::SaveYaml.new({lang: 'nl', file: 'profile', path: 'profile'}, "Profiel") }

  before(:all) do
    FileUtils::mkdir_p("#{Dir.pwd}/tmp/config/locale")
    system "touch", "#{Dir.pwd}/tmp/config/locale/nl_profile.yml"
  end

  after(:all) do
    system "rm", "-rf", "#{Dir.pwd}/tmp"
  end

  it 'should be able to locate the file' do
    expect(yml.get_file).to eq("nl_profile.yml")
  end

  it 'should be able to determine the file exists' do
    expect(yml.exists?).to eq(true)
  end

  it 'should be able to generate a valid yaml hash' do
    expect(yml.to_hash).to eq({nl: {profile: "Profiel"}})
  end
end
