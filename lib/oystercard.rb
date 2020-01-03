class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end 

  def top_up(amount)
    raise "Over £#{MAXIMUM_BALANCE} maximum balance" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end
end 