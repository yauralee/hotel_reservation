require 'requirement_case'
require 'parser/input_parser'

RSpec.describe RequirementCase do
  let(:input_parser) {InputParser.new}
  let(:customer_and_dates) {input_parser.yaml_parser('resource/customer_and_dates.yml')}
  describe '#initialize' do
    context 'with a case of customer and dates' do
      it 'should return an instance of requirement case' do
        certain_case = customer_and_dates['case1']
        requirement_case = RequirementCase.new(certain_case)
        expect(requirement_case.customer_type).to eq('regular')
        expect(requirement_case.weekday_number).to be(3)
        expect(requirement_case.weekend_number).to be(0)
      end
    end
  end
end


