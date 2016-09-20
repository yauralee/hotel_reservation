require 'parser/input_parser'
require 'hotel'
require 'calculator'
require 'requirement_case'

RSpec.describe Calculator do
  let(:input_parser) {InputParser.new}
  let(:calculator) {Calculator.new}
  let(:requirement_case) {RequirementCase.new(input_parser.yaml_parser('resource/customer_and_dates.yml')['case1'])}
  let(:hotel_rates) {input_parser.yaml_parser('resource/hotel_rates.yml')}

  describe '#reservation' do
    context 'hotels info and requirement case' do
      it 'should return optimal hotel name' do
        hotels = []
        hotel_rates.each do |name, rates|
          hotels << Hotel.new(name, rates)
        end
        expect(calculator.reservation(requirement_case, hotels)).to eq('Lakewood')
      end
    end
  end
end