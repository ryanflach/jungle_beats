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
      head_assign_next_node(node)
    else
      @tail.next_node = node
    end
    assign_tail(node)
    @count += 1
  end

  def prepend(data)
    node = create_node(data)
    if head == nil
      assign_head(node)
    else
      head_holding = head
      assign_head(node)
      head_assign_next_node(head_holding)
    end
  end

  def to_string (starting=head, start=0, num=count)
    if empty?
      empty_message
    else
      string = ""
      ending = starting
      current_position = start
      until current_position == start + num
        break if ending == nil
        string << ending.data + " "
        ending = ending.next_node
        current_position += 1
      end
      string.chop!
    end
  end

  def find(start, num_elements)
    to_string(navigate_to(start),start, num_elements)
  end

  def navigate_to(place)
    if empty?
      empty_message
    elsif place < 0
      head
    else
      current_location = head
      position = 0
      while current_location.next_node != nil && position != place
        current_location = current_location.next_node
        position += 1
      end
      current_location
    end
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

  def include?(data)
    if empty?
      empty_message
    else
      starting = head
      while starting.data != data && starting.next_node != nil
        starting = starting.next_node
      end
      true if starting.data == data
    end
  end

  def pop
    if count <= 1
      assign_head(nil)
      assign_tail(nil)
    elsif count == 2
      head_assign_next_node(nil)
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
    @count -= 1 if count > 0
  end

  private
  # Helper methods to reduce redundancy
  def empty?
    count == 0 ? true : false
  end

  def empty_message
    "List is empty!"
  end

  def assign_head(node)
    @head = node
  end

  def assign_tail(node)
    @tail = node
  end

  def head_assign_next_node(node)
    @head.next_node = node
  end

end
