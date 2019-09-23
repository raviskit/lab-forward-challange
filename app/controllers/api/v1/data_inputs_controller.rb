require 'json'

module Api::V1
  class DataInputsController < ApplicationController

    # POST output
    def output
      return render json: { message: 'Invalid Input' }, status: :bad_request if ( params.nil? || params[:input].nil? || params[:threshold].nil? )
      data = JSON.parse(params[:input].to_s)
      threshold = params[:threshold].to_i

      output = data.map do |input|
        input.to_i > threshold ? 1 : 0
      end

      render json: { output: output, message: 'output generated successfully' }, status: :ok
    end


  end
end

