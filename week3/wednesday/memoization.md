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
        @answer ||= calculate_answer
      end
      
      private
      
      def calculate_answer
        a = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
        (a * 10.5).to_i
      end
    end
    
#### Or Equal (||=)

    class Person
      def full_name
        if @full_name.nil?
          @full_name = "#{@first_name} #{@last_name}"
        else
          @full_name
        end
      end
    
      def full_name
        @full_name ||= "#{@first_name} #{last_name}"
      end
    end