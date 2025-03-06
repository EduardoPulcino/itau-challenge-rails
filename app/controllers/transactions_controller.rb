class TransactionsController < ApplicationController
  protect_from_forgery prepend: true

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction.to_json(except: [:created_at, :updated_at]), status: :created
    else
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.delete

    head :no_content
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:value, :transaction_time)
  end
end
