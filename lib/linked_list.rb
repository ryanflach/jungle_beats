require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def create_node(data, next_node=nil)
    Node.new(data, next_node)
  end

  def tail(current_node=head)
    if empty?
      nil
    elsif current_node.next_node == nil
      current_node
    else
      current_node = current_node.next_node
      tail(current_node)
    end
  end

  def count(current_node=head, nodes=0)
    if empty?
      nodes
    elsif current_node.next_node == nil
      nodes += 1
    else
      current_node = current_node.next_node
      count(current_node, nodes += 1)
    end
  end

  def append(data, current_node=head)
    if empty?
      assign_head(data)
    elsif current_node.next_node == nil
      current_node.next_node = create_node(data)
    else
      current_node = current_node.next_node
      append(data, current_node)
    end
  end

  def prepend(data)
    if head == nil
      assign_head(data)
    else
      head_holding = head
      assign_head(data)
      head_assign_next_node(head_holding)
    end
  end

  def to_string (starting=head, start=0, num=count)
    if empty?
      nil
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
    if empty? || place > count - 1
      nil
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
      prior_node = navigate_to(place - 1)
      current_node = navigate_to(place)
      node = create_node(data, current_node)
      prior_node.next_node = node
    end
  end

  def include?(data)
    if empty?
      false
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
    elsif count == 2
      head_assign_next_node(nil)
    else
      new_tail = navigate_to(count - 2)
      new_tail.next_node = nil
    end
  end

  private

  def empty?
    head == nil
  end

  def assign_head(node)
    if node == nil
      @head = nil
    else
      @head = create_node(node)
    end
  end

  def head_assign_next_node(node)
    @head.next_node = node
  end

end
