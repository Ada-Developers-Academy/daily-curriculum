# Exploring attr_accessor

The following example show a duplicative example of the method defined manually and those defined using `attr_accessor` and `attr_reader`

    class Book
      # The following attr_accessor methods defines a `getter` and `setter` method for `title` and `author`
      # Line 4 accomplishes what is written between Lines 9-23
      attr_accessor :title, :author
      # attr_reader is similar to attr_accessor, but only defines a `setter` method. 
      #Line 7 accomplishes what is written between Lines 25-27.
      attr_reader :pages
  
      def title
        @title
      end
  
      def title=(title_var)
        @title = title_var
      end
  
      def author
        @author
      end
  
      def author=(author_var)
        @author = author_var
      end

      def pages
        @pages
      end
  
    end # end Book

Note: Much of this lesson is live coded, showing the defined methods using a manual approach compared to attr_accessor