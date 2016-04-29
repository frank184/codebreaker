require 'spec_helper'
require 'codebreaker_helper'

module Codebreaker
  describe Marker do
    describe "#count_exact_matches" do
      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('1234', '5555')
          expect(marker.count_exact_matches).to be(0)
        end
      end
      context "with 1 exact match" do
        it "returns 1" do
          marker = Marker.new('1234', '1555')
          expect(marker.count_exact_matches).to be(1)
        end
      end
      context "with 1 number match" do
        it "returns 0" do
          marker = Marker.new('1234', '2555')
          expect(marker.count_exact_matches).to be(0)
        end
      end
      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234', '1525')
          expect(marker.count_exact_matches).to be(1)
        end
      end
    end
    describe "#count_number_matches" do
      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('1234', '5555')
          expect(marker.count_number_matches).to be(0)
        end
      end
      context "with 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234', '2555')
          expect(marker.count_number_matches).to be(1)
        end
      end
      context "with 1 exact match" do
        it "returns 0" do
          marker = Marker.new('1234', '1555')
          expect(marker.count_number_matches).to be(0)
        end
      end
      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234', '1525')
          expect(marker.count_number_matches).to be(1)
        end
      end
      context "with 1 exact match duplicated in guess" do
        it "returns 0" do
          # pending('refactor count_number_matches')
          marker = Marker.new('1234', '1155')
          expect(marker.count_number_matches).to be(0)
        end
      end
    end
  end
end
