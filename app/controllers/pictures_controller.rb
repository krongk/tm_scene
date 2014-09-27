#encoding: utf-8
class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:create, :meitu_upload]

  # GET /pictures
  # GET /pictures.json
  def index
    @galleries = Gallery.all
    @pictures = current_user.pictures.page(params[:page]||1)
  end

  #get 用于展示模态框
  def meitu_load
    @gallery = Gallery.find_by(:id, params[:gallery_id])
    @picture = Picture.find_by(id: params[:id])
    @gallery ||= @picture.try(:gallery)
    #editorType int， 为要嵌入的编辑器类型（1为轻量编辑，2为轻量拼图，3为完整版，5为头像编辑器，默认值1）
    @editor_type = params[:editor_type]
    @editor_type ||= 1
  end

  #post 用于保存修改
  def meitu_upload
    @picture = Picture.find_by(id: params[:id])
    not_found if @picture.nil?
    #替换图片
    @picture.asset = params[:picture][:asset]
    @picture.save!
    @picture.reload

    respond_to do |format|
      format.js
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.create(picture_params)
    respond_to do |format|
      format.js
      format.html { redirect_to pictures_url, notice: '图片添加成功.' }
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '图片更新成功.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice:  t('notice.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
      authorize!(@picture)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:user_id, :gallery_id, :name, :key, :asset, :asset_file_name, :assetfile_size, :asset_content_type )
    end
end
