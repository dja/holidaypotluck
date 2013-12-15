class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
	end

	def create
		if Userbin.current_user
			@item = Item.new(item_params)
			@item.user = Userbin.current_user
			@item.save!
		end
		redirect_to items_path
	end

	def destroy
		item = Item.find(params[:id])
		if item.user == Userbin.current_user
			if item.destroy
				render :status => :ok, :json => { status: 'SUCCESS' }
			else
				render :status => 422, :json => { status: 'FAILED' }
			end
		end
	end

	private

	def item_params
		params.require(:item).permit(:item_type, :title, :link)
	end
end
