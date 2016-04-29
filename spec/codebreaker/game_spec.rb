require 'spec_helper'
require 'codebreaker_helper'

module Codebreaker
  describe Game do
    describe "#start" do

      # before(:each) do
      #   @out = double('output').as_null_object
      #   @game = Game.new(@out)
      # end

      let(:out) { double('output').as_null_object }
      let(:game) { Game.new(out) }

      it "sends a welcome message" do
        expect(out).to receive(:puts).with('Welcome to Codebreaker!')
        game.start
      end

      it "prompts for the first guess" do
        expect(out).to receive(:puts).with('Enter guess:')
        game.start
      end
    end
  end
end
