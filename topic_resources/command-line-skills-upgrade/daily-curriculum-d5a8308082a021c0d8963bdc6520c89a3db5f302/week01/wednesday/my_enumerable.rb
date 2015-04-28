module MyEnumerable
  class Array < Object::Array

    def each
      i = 0
      while self[i]
        yield self[i]
        i += 1
      end
      self
    end

    def each_with_index
      i = 0
      while self[i]
        yield self[i], i
        i += 1
      end
      self
    end

    def map
      i, result = 0, []
      while self[i]
        result << (yield self[i])
        i += 1
      end
      result
    end

    def map!
      i = 0
      while self[i]
        self[i] = (yield self[i])
        i += 1
      end
      self
    end

    def select
      i, result = 0, []
      while self[i]
        result << self[i] if (yield self[i])
        i += 1
      end
      result
    end

    def reject
      i, result = 0, []
      while self[i]
        result << self[i] if !(yield self[i])
        i += 1
      end
      result
    end
  end
end
