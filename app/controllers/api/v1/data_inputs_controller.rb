require 'json'

module Api::V1
  class DataInputsController < ApplicationController

    # POST create
    def create
      data_input = DataInput.create(data_input_params)
      if data_input.save
        render json: { signal: data_input, message: 'input added successfully' }, status: :ok
      else
        render json: { message: 'Invalid signal input' }, status: :internal_server_error
      end
    end

    # POST output
    def output
      return signal_between_dates if params[:start_date].present? || params[:end_date].present?
      return render json: { message: 'Invalid Input' }, status: :bad_request if ( params.nil? || params[:input].nil? || params[:threshold].nil? )
      data = JSON.parse(params[:input].to_s)
      threshold = params[:threshold].to_i

      output = data.map do |input|
        input.to_i > threshold ? 1 : 0
      end

      render json: { signal: output, message: 'output generated successfully' }, status: :ok
    end

    private

    # method will be called when data is queried from database based on the dates provided.
    def signal_between_dates
      return render json: { message: 'Invalid Input' }, status: :bad_request if ( params[:start_date].nil? || params[:end_date].nil? )

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      data_inputs = DataInput.where(created_at: start_date..end_date)

      output = []
      data_inputs.each do |input|

        output << JSON.parse(input.input).map { |i| i > input.threshold.to_i ? 1 : 0 }
      end

      render json: { signal: output, message: 'output generated successfully' }, status: :ok
    rescue ArgumentError
      return render json: { message: 'Invalid Date or format' }, status: :bad_request
    end

    def data_input_params
      params.permit(:id, :input, :threshold)
    end
  end
end

