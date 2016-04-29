module Codebreaker
  class Marker
    def initialize(secret, guess)
      @secret, @guess = secret, guess
    end

    def count_exact_matches
      4.times.inject(0) do |count, index|
        count + (exact_match?(index) ? 1 : 0)
      end
    end

    def count_number_matches
      4.times.inject(0) do |count, index|
        count + (number_match?(index) ? 1 : 0)
      end
    end

    def exact_match?(index)
      @secret[index].eql?(@guess[index])
    end

    def number_match?(index)
      @secret.include?(@guess[index]) && !exact_match?(index)
    end
  end
end
