module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret=nil)
      @secret = secret
      @secret ||= SecretCode.new
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      @output.puts('+' * count_exact_matches(guess) + '-' * count_number_matches(guess))
    end

    def exact_match?(guess, index)
      @secret[index].eql?(guess[index])
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end

    def count_exact_matches(guess)
      4.times.inject(0) do |count, index|
        count + (exact_match?(guess, index) ? 1 : 0)
      end
    end

    def count_number_matches(guess)
      4.times.inject(0) do |count, index|
        count + (number_match?(guess, index) ? 1 : 0)
      end
    end
  end
end
