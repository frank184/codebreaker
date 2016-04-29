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
      # 4.times.inject(0) do |count, index|
      #   count + (number_match?(index) ? 1 : 0)
      # end
      count_total_matches - count_exact_matches
    end

    def exact_match?(index)
      @secret[index].eql?(@guess[index])
    end

    def number_match?(index)
      @secret.include?(@guess[index]) && !exact_match?(index)
    end

    def count_total_matches
      # count = 0
      secret = @secret.split('')
      @guess.split('').inject(0) do |count, n|
        # if secret.include?(n)
        #   secret.delete_at(secret.index(n))
        #   count += 1
        # end
        count + (delete_first?(secret, n) ? 1 : 0)
      end
    end

    def delete_first?(secret, n)
      secret.delete_at(secret.index(n)) if secret.include?(n)
    end

  end
end
