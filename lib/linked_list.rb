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
      assign_head(node)
    elsif head.next_node == nil
      head_assign_next(node)
    else
      temp_tail_assign_next(node)
    end
    assign_tail(node)
    increment_count(1)
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
  end

  def prepend(data)
    node = create_node(data)
    if head == nil
      assign_head(node)
    else
      head_holding = head
      assign_head(node)
      head_assign_next(head_holding)
    end
  end

  def navigate_to(place)
    current_location = head
    position = 0
    while current_location.next_node != nil && position != place
      current_location = current_location.next_node
      position += 1
    end
    current_location
  end

  def insert(place, data)
    if place <= 0
      # Place is head or negative. This will be the new head.
      prepend(data)
    elsif place > count - 1
      # Place is beyond the tail. This will be the new tail.
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
    current_position = start
    until current_position == start + num_elements
      string << ending_value.data.to_s + " "
      ending_value = ending_value.next_node
      current_position += 1
    end
    string.chop!
    string
  end

  def include?(data)
    starting = head
    while starting.data != data && starting.next_node != nil
      starting = starting.next_node
    end
    true if starting.data == data
  end

  def pop
    if count <= 1
      assign_head(nil)
      assign_tail(nil)
    elsif count == 2
      head_assign_next(nil)
      assign_tail(head)
    else
      new_tail = head
      position = 0
      until position == count - 2
        new_tail = new_tail.next_node
        position += 1
      end
      assign_tail(new_tail)
    end
    decrement_count(1) if count > 0
  end

  def assign_head(node)
    @head = node
  end

  def assign_tail(node)
    @tail = node
  end

  def head_assign_next(node)
    @head.next_node = node
  end

  def temp_tail_assign_next(node)
    @tail.next_node = node
  end

  def increment_count(num)
    @count += num
  end

  def decrement_count(num)
    @count -= num
  end

end
