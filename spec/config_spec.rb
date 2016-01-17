require 'spec_helper'

describe SlackBot::Config do
  before do
    SlackBot.configure do |config|
      config.join_message = 'Hi!'
      config.debug = true
      config.token = 'TOKEN'
    end
  end

  it 'sets config' do
    expect(SlackBot.config.join_message).to eq 'Hi!'
    expect(SlackBot.config.debug).to eq true
    expect(SlackBot.config.token).to eq 'TOKEN'
  end
end