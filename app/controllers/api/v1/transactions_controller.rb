# Transaction endpoints
module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        transactions = Transaction.filter(filtering_params)
        paginate json: transactions
      end

      def show
        transaction = Transaction.find_by(id: params[:id])
        return render json: transaction if transaction.present?
        render json: { error: 'resource not found' }, status: :not_found
      end

      def create
        transaction = Transaction.new(create_params)
        if transaction.save
          render json: transaction, status: :created
        else
          render json: {
            errors: transaction.errors,
            status: :unprocessable_entity
          }
        end
      end

      private

      def create_params
        params.require(:transaction).permit(
          :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date
        )
      end

      def filtering_params
        params.slice(:customer_id, :input_currency, :output_currency, :input_amount, :output_amount, :transaction_date)
      end
    end
  end
end