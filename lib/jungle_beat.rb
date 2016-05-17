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
end
