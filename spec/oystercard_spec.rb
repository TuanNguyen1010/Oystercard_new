require 'oystercard'

describe Oystercard do 

    describe 'balance' do 
      it 'has a default balance of 0' do 
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
      end 
    end 
end