module Fake
  class STDOUT
    def messages
      @messages ||= Array.new
    end

    def puts(message)
      messages << message
    end
  end
end

def out
  @out ||= Fake::STDOUT.new
end

# features/codebreaker_starts_game.feature
Given(/^I am not yet playing$/) do
  # nothing
end

When(/^I start a new game$/) do
  @game = Codebreaker::Game.new(out)
  @game.start('1234')
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(out.messages).to include(message)
end

# features/codebreaker_submits_guess.feature
Given(/^the secret code is "([^"]*)"$/) do |code|
  @game = Codebreaker::Game.new(out)
  @game.start(code)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  expect(@out.messages).to include(mark)
end
