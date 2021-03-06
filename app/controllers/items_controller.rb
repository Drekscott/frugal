class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

	def new
		@item = Item.new
	end

    def show
        @item = Item.find(params[:id])
    end
    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to items_path
        else
            render 'edit'
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            flash[:success] = "item created"
            redirect_to items_path
        end
    end

     private
     def item_params
         params.require(
            :item).permit(
            :name,
            :relevant_link,
            :body,
            :category_id,
            :user_id)
     end
end
