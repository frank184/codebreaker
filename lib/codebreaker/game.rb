module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      mark = ''
      4.times { |i| mark << '+' if exact_match?(guess, i) }
      4.times { |i| mark << '-' if number_match?(guess, i) }
      @output.puts(mark)
    end

    def exact_match?(guess, index)
      @secret[index].eql?(guess[index])
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end
  end
end
