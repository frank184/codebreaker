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
      marker = Marker.new(@secret, guess)
      @output.puts('+' * marker.count_exact_matches + '-' * marker.count_number_matches)
    end

  end
end
