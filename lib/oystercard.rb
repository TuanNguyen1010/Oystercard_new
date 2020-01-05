class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey
  end 

  def top_up(amount)
    raise "Over £#{MAXIMUM_BALANCE} maximum balance" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @journey
  end 

  def touch_in
    raise "Not enough balance available" if @balance < MINIMUM_FARE
    @journey = true
  end 

  def touch_out
    deduct(MINIMUM_FARE)
    @journey = nil
  end 

  private 

  def deduct(amount)
    @balance -= amount
  end 
  
end 