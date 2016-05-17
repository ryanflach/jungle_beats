require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data_list = data.split
    data_list.each { |data| list.append(data) }
  end

  def count
    list.count
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

  
end
