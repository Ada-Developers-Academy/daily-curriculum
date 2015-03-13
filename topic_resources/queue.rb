class Queue
  def initialize
    @backing_store = []
  end

  def enqueue(el)
    @backing_store.push el
  end

  def dequeue
    @backing_store.shift
  end

end
