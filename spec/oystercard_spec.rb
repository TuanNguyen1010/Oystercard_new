require 'oystercard'

describe Oystercard do 
  subject(:oystercard) {described_class.new}

  describe 'balance' do 
    it 'has a default balance of 0' do 
      expect(oystercard.balance).to eq(0)
    end 
  end 

  describe 'top up' do 
    it 'respond top_up with 1 arguement' do 
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end 

    it 'it increase the balance by 10' do 
      expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
    end 

    it 'raises an error if top up over maximum balance' do 
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      expect { oystercard.top_up(1) }.to raise_error("Over £#{Oystercard::MAXIMUM_BALANCE} maximum balance")
    end 
  end 

  describe 'deduct' do 
    it 'responds to deduct with 1 argument' do
      expect(oystercard).to respond_to(:deduct).with(1).argument 
    end 

    it 'decreases the balance by 5' do 
      oystercard.top_up(10)
      expect{oystercard.deduct(5)}.to change{oystercard.balance}.by(-5)
    end 
  end 

  describe 'in_journey?' do 
    it 'starts with in_journey? equals false' do 
      expect(oystercard).not_to be_in_journey
    end 
  end

  describe 'touch in' do
    it 'changes in_journey? to true' do 
      oystercard.top_up(10)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end 

    it 'raises an error when there is less than £1 balance' do
      expect{ oystercard.touch_in }.to raise_error("Not enough balance available")
    end 
  end 

  describe 'touch out' do 
    it 'changes in_journey to false after touch in and then touch out' do 
      oystercard.top_up(10)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end 
  end 
end