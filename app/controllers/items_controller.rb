class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :delivery, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end
  
  def delivery
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    begin
      respond_to do |format|
        @item.save!
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      end
    rescue 
        # 入荷処理
        respond_to do |format|
          if Item.find_by(name: @item.name )
            target = Item.find_by(name: @item.name)
            target.number += item_params[:number].to_f
            if target.save
              format.html { redirect_to @item, notice: 'Item was successfully created.' }
              format.json { render :show, status: :created, location: @item }
            else
              format.html { render :new }
              format.json { render json: @item.errors, status: :unprocessable_entity }
            end
          end
        end
    end

=begin
        if @item.save
          format.html { redirect_to @item, notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
=end
  end


  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :place, :status, :number, :unit_id, :description, :image, :updated_date, :updated_person_id, item_category_ids: [])
    end
end
