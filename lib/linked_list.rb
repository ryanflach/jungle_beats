class LinkedList
  attr_reader :head, :tail, :count, :string

  def initialize
    @head = nil
    @tail = nil
    @count = 0
    @string = ""
  end

  def append(node)
    if head == nil
      @head = node
    else
      @head.next_node = node
    end
    @count += 1
  end

  def to_string
    if count == 1
      @string << head.data.to_s
    elsif count > 1
      @string << head.data.to_s + " " + head.next_node.to_s
    end
  end

end
