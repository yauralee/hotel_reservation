require 'parser/input_parser'

RSpec.describe InputParser, type: :parser do
  let(:input_parser) {InputParser.new}
  describe '#yaml_parser' do
    context 'with hotel rates' do
      it 'should return parsed hotel rates as hash' do
        file_name = 'resource/hotel_rates.yml'
        hotel_rates = {"Bridgewood" => {"rating"=>4, "regularCustomer"=>{"weekdayRates"=>160, "weekendRates"=>60}, "rewardsCustomer"=>{"weekdayRates"=>110, "weekendRates"=>50}},
                       "Lakewood" => {"rating"=>3, "regularCustomer"=>{"weekdayRates"=>110, "weekendRates"=>90}, "rewardsCustomer"=>{"weekdayRates"=>80, "weekendRates"=>80}},
                       "Ridgewood" => {"rating"=>5, "regularCustomer"=>{"weekdayRates"=>220, "weekendRates"=>150}, "rewardsCustomer"=>{"weekdayRates"=>100, "weekendRates"=>40}},
        }
        expect(input_parser.yaml_parser(file_name)).to eq(hotel_rates)
      end
    end

    context 'with customer and dates cases' do
      it 'should return parsed requirement information for reservation' do
        file_name = 'resource/customer_and_dates.yml'
        customer_and_dates = {"case1" => {"customer"=>"regular", "dates"=>{"16Mar2009"=>"mon", "17Mar2009"=>"tues", "18Mar2009"=>"wed"}},
                              "case2" => {"customer"=>"regular", "dates"=>{"20Mar2009"=>"fri", "21Mar2009"=>"sat", "22Mar2009"=>"sun"}},
                              "case3" => {"customer"=>"rewards", "dates"=>{"26Mar2009"=>"thur", "27Mar2009"=>"fri", "28Mar2009"=>"sat"}},
        }
        expect(input_parser.yaml_parser(file_name)).to eq(customer_and_dates)
      end
    end
  end
end