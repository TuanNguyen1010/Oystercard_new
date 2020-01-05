class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journeys = []
  end 

  def top_up(amount)
    raise "Over £#{MAXIMUM_BALANCE} maximum balance" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station
  end 

  def touch_in(entry_station)
    raise "Not enough balance available" if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end 

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @journeys.push({entry_station: @entry_station, exit_station: @exit_station})
    @entry_station = nil
  end 

  private 

  def deduct(amount)
    @balance -= amount
  end 

end 