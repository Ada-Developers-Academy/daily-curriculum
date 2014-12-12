class ListItem
  attr_accessor :data, :next

  def initialize(data, nxt = nil)
    @data, @next = data, nxt
  end
end

ListItem2 = Struct.new(:data, :next)

module ListProcessor
  def self.linear_search(want, list)
    l = list
    until l.nil? or l.data == want
      l = l.next
    end
  end

  def self.recursive_search(want, list)
    if list.data == want
      list
    elsif list.next.nil?
      nil
    else
      recursive_search(want, list.next)
    end
  end
end
