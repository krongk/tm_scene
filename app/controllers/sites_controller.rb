class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :edit_common_section, :preview]
  before_filter -> { authorize! @site }, only: [:edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
   
  end

  def preview
    
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  def edit_common_section
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    respond_to do |format|
      if @site.save_all
        if @site.template.form.blank?
          format.html { redirect_to @site, notice: '应用创建成功，下一步开始完善信息.' }
          format.json { render :show, status: :created, location: @site }
        else
          format.html { redirect_to edit_common_section_path(@site), notice: '应用创建成功，下一步开始完善信息.' }
          format.json { render :show, status: :created, location: @site }
        end
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
   
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    #render text: "#{params}\n=> #{site_params}" and return
    respond_to do |format|
      if @site.update(site_params)
        #skip the site_params and then store the other to keystore
        #this rule is used on :edit_common_section
        site_params.each_pair{|k, v| params[:site].delete(k)}
        params[:site].each_pair do |key, val|
          #next if val.blank? -- xj: need to save blank value, to overwrite the original value
          Keystore.put(@site, key, val)
        end

        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:template_id, :key, :status, :title, :description, :preview_image_key, :is_private, :private_password, :html)
    end
end
