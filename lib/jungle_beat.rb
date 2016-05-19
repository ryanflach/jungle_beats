require './lib/linked_list'

class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

  def append(data)
    data_list = data_conversion(data)
    data_list.each { |data| list.append(data) }
  end

  def prepend(data)
    data_list = data_conversion(data).reverse
    data_list.each { |data| list.prepend(data) }
  end

  def count
    list.count
  end

  def play
    `say -r #{rate} -v #{voice} #{list.to_string}`
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def data_conversion(data)
    data.downcase.gsub(/[^a-z0-9]/, ' ').split
  end

end
