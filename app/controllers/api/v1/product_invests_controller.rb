class Api::V1::ProductInvestsController < ApplicationController
	#before_action :authenticate_user
	skip_before_action :verify_authenticity_token
	before_action :find_prodinvest, only: [:destroy, :show]

def index
	prodinvests = ProductInvest.all
	if prodinvests.present?
		render json: {
			status: 'OK', results: prodinvests, error: nil
		}, status: :ok
	else
		render json: {
			status: 'FAIL', results: nil, error: 'Data is Empty'
		}, status: :unprocessable_entity
	end
end

def create
	prodinvest = ProductInvest.new(prodinvest_params)
	if prodinvest.save
		render json: {
			status: 'OK', results: prodinvest, error: nil
		}, status: :ok
	else
		render json: {
			status: 'FAIL', results: nil, error: 'Data failed to create'
		}, status: :unprocessable_entity
	end
end

	def show
		if @prodinvest.present?
			@prodinvest.count_view += 1
			@prodinvest.save
			render json: {
				status: 'OK', results: @prodinvest, error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data not found'
			}, status: :unprocessable_entity
		end
	end

	def update
		update_prodinvest = ProductInvest.update(prodinvest_params)
		if update_prodinvest
			render json: {
				status: 'OK', results: update_prodinvest, error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data fail to update'
			}, status: :unprocessable_entity
		end
	end

	def destroy
		if @prodinvest
			@prodinvest.destroy!
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

	def find_prodinvest
		@prodinvest = ProductInvest.find_by(id: params[:id])
	end

	def prodinvest_params
		params.require(:prodinvest).permit(:price, :slot, :count_view)
	end
end
