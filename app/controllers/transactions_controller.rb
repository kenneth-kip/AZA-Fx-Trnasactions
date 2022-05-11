class TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    paginate json: transactions
  end

  def show
    transaction = Transaction.find_by(id: params[:id])
    render json: transaction
    
  end

  def create
    transaction = Transaction.new(create_params)
    if transaction.save
      render jsonapi: transaction, fields: { trenasactions: [:id, :customer_id, :input_amount, :output_amount] }
    else
      render jsonapi_error: transaction.errors
    end
  end

  private

  def create_params
    params.require(:transaction).permit(
      :customer_id, :input_amount, :input_currency, :output_amount, :output_currency
    ).merge(
      transaction_date: DateTime.now
    )
  end
end
