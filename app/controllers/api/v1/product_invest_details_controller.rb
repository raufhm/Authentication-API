class Api::V1::ProductInvestDetailsController < ApplicationController
	before_action :authenticate_user, only: [update, delete]
	before_action :find_proinvdetail, only: [:destroy, :show]

	def index
		proinvdetails = ProductInvestDetail.all
		if proinvdetails.present?
			render json: {
				status: 'OK', result: proinvdetails, error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data is empty'
			}, status: :unprocessable_entity
		end
	end

	def create
		proinvdetail = ProductInvestDetail.new(proinvdetail_params)
		if proinvdetail.save
			render json: {
				status: 'OK', results: proinvdetail, error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data failed to created'
			}, status: :unprocessable_entity
		end
	end

	def show
		if @proinvdetail.present?
			render json: {
				status: 'OK', results: @proinvdetail, error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data not found'
			}, status: :unprocessable_entity
		end
	end

	def update
		update_proinvdetail = @proinvdetail.update(proinvdetail_params)
		if update_proinvdetail
		  render json: {
		  	status: 'OK', results: update_proinvdetail, error: nil
		  }, status: :ok
		else
		  render json: {
		  	status: 'FAIL', results: nil, error: 'Data fail to update'
		  }, status: :unprocessable_entity
		end
	end

	def destroy
		#@proinvdetails = ProductInvestDetail.find(params[:id])
		if @proinvdetail
			@proinvdetail.destroy!
			render json: {
				status: 'OK', results: 'Delete Success', error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Delete failed'
			}, status: :unprocessable_entity
		end
	end

	private

	def find_proinvdetail
		@proinvdetail = ProductInvestDetail.find_by(id: params[:id])
	end

	def proinvdetail_params
		params.require(:proinvdetail).permit(:description, :period, :return_value, :share_periode, :background)
	end
end

