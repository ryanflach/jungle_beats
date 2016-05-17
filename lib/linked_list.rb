require './lib/node'

class LinkedList
  attr_reader :head, :tail, :count

  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end

  def create_node(data)
    Node.new(data)
  end

  def append(data)
    node = create_node(data)
    if head == nil
      node.position = 0
      @head = node
    elsif head.next_node == nil
      node.position = 1
      @head.next_node = node
      @tail = node
    else
      node.position = tail.position + 1
      @tail.next_node = node
      @tail = node
    end
    @count += 1
  end

  def to_string
    string = ""
    starting = head
    string << starting.data + " "
    until starting.next_node == nil
      starting = starting.next_node
      string << starting.data + " "
    end
    string.chop!
    string
  end

  def prepend(data)
    node = create_node(data)
    if head == nil
      @head = node
    else
      head_holding = head
      @head = node
      @head.next_node = head_holding
    end
  end

  def navigate_to(place)
    current_location = head
    until current_location.position == place
      current_location = current_location.next_node
    end
    current_location
  end

  def insert(place, data)
    if place <= 0
      # puts "Place #{place} requested. This will be the new head."
      prepend(data)
    elsif place > tail.position
      # puts "This is beyond the tail. Placing at position #{tail.position + 1} as the new tail."
      append(data)
    else
      node = create_node(data)
      prior_node = navigate_to(place - 1)
      current_node = navigate_to(place)
      prior_node.next_node = node
      node.next_node = current_node
    end
  end

  def find(start, num_elements)
    starting_value = navigate_to(start)
    ending_value = starting_value
    string = ""
    until ending_value.position == start + num_elements
      string << ending_value.data.to_s + " "
      ending_value = ending_value.next_node
    end
    string.chop!
    string
  end

  def include?(data)
    starting = head
    while starting.data != data && starting.next_node != nil
      starting = starting.next_node
    end
    if starting.data == data
      true
    else
      false
    end
  end

  def pop
    starting = head
    until starting.position == tail.position - 1
      starting = starting.next_node
    end
    @tail = starting
  end

end
