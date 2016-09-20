# require 'require_all'
# require_all 'lib'
require '../lib/parser/input_parser'
require '../lib/calculator'
require '../lib/result_printer'
require '../lib/requirement_case'
require '../lib/hotel'

class ProcessHandler
  def self.process(customer_and_dates, hotel_rates)
    input_parser = InputParser.new()
    requirement_cases = input_parser.yaml_parser(customer_and_dates)
    cases = []
    requirement_cases.each_value do |requirement_case|
      cases << RequirementCase.new(requirement_case)
    end
    hotel_rates = input_parser.yaml_parser(hotel_rates)
    hotels = []
    hotel_rates.each do |name, rates|
      hotels << Hotel.new(name, rates)
    end
    result_array = Calculator.new.reservation_for_cases(cases, hotels)
    ResultPrinter.new.print_result(result_array)
  end
end

ProcessHandler.process('../resource/customer_and_dates.yml', '../resource/hotel_rates.yml')