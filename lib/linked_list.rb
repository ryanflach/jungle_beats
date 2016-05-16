class LinkedList
  attr_reader :head, :tail, :count, :string

  def initialize(head=nil)
    @head = head
    @tail = nil
    @count = 0
    @string = ""
  end

  def append(node)
    if head == nil
      @head = node
    elsif tail == nil
      @tail = node
    end
    @count += 1
  end

  def to_string
    @string << head.data.to_s
  end

end
