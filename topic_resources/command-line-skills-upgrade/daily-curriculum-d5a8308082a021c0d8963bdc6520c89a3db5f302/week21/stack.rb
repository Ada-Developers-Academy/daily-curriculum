class Stack
  def initialize
    @backing_store = []
  end

  def pop
    @backing_store.pop
  end

  def push(el)
    @backing_store.push el
  end
end
