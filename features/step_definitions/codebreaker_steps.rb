module Test
  class Output
    def messages
      @messages ||= Array.new
    end

    def puts(message)
      messages << message
    end
  end
end

def out
  @out ||= Test::Output.new
end

Given(/^I am not yet playing$/) do
  # nothing
end

When(/^I start a new game$/) do
  @game = Codebreaker::Game.new(out)
  @game.start
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(out.messages).to include(message)
end
