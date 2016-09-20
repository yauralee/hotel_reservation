require 'hotel'
require 'parser/input_parser'

RSpec.describe Hotel do
  let(:input_parser) {InputParser.new}
  let(:hotels) {input_parser.yaml_parser('resource/hotel_rates.yml')}
  describe '#initialize' do
    context 'with hotel rates' do
      it 'should return an instance of hotel' do
        hotel = Hotel.new(hotels.keys[0], hotels.values[0])
        expect(hotel.name).to eq(hotels.keys[0])
        expect(hotel.rating).to eq(3)
        expect(hotel.regular_weekday_rates).to be(110)
        expect(hotel.regular_weekend_rates).to be(90)
        expect(hotel.rewards_weekday_rates).to be(80)
        expect(hotel.rewards_weekend_rates).to be(80)
      end
    end
  end
end


