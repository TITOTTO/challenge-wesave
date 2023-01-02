require 'option'
require 'pry'

describe Option do

  describe "#initialize" do
    it 'return no error' do
      expect{Option.new(id: 1, rental_id: 1, type: 'gps')}.to_not raise_error
    end

    it 'return an error' do
      expect{Option.new(id: 1, rental_id: 1, type: 'test')}.to raise_error(StandardError, "Ce n'est pas un type valide")
    end
  end

  describe "#additionnal_option" do
    let(:option) {Option.new(id: 1, rental_id: 1, type: 'gps')}

    it { expect(option.additionnal_option).to eq 200}
  end

end