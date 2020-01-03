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
end