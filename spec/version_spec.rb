require 'spec_helper'

describe SlackBot do
  it 'has a version' do
    expect(SlackBot::VERSION).to_not be nil
  end
end