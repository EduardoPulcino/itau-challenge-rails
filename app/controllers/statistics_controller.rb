class StatisticsController < ApplicationController
  before_action :calculate_transaction_statistics, only: %i[ index ]
  
  def index
    puts '-------------'
    puts params[:time_interval]
    puts 

    render json: {
      count: @count,
      sum: @sum,
      avg: @avg,
      min: @min,
      max: @max
    }, status: :ok
  end

  private

  def calculate_transaction_statistics
    time_interval = params[:time_interval].present? ? params[:time_interval].to_i : 60
    transactions = find_last_transactions(time_interval)

    @count = transactions.count
    @sum = transactions.sum(:value)
    @min = transactions.minimum(:value)
    @max = transactions.maximum(:value)
    @avg = @count.zero? ? 0 : @sum / @count
  end

  def find_last_transactions(time_interval)
    Transaction.where('transaction_time >= ?', time_interval.seconds.ago)
  end
end
