class ResultPrinter
  def print_result(result_array)
    result_array.each_with_index do |result, counter|
      puts 'OUTPUT #' + counter.to_s + ' : ' + result
    end
  end
end
