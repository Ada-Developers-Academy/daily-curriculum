# Memoization

Memoization is an optimization technique used to store the result of expensive (slow) method calls for later re-use. This allows us to avoid repeatedly performing an expensive calculation when the result has already been calculated once. 

    class EnourmousSuperComputer
  
      def answer_to_the_ultimate_question_of_life_the_universe_and_everything
        answer = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
        (answer * 10.5).to_i
      end
  
    end    
    
--------

    class EnourmousSuperComputer
      
      def answer_to_the_ultimate_question_of_life_the_universe_and_everything
        @answer ||= think
        (@answer * 10.5).to_i
      end
      
      private
      
      def think
        sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
      end
    end