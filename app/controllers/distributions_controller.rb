# encoding: utf-8
class DistributionsController < ApplicationController
  before_filter :require_login, :check_config
  # GET /distributions
  # GET /distributions.json

  def index
    @distributions = current_user.distributions
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @distributions }
    end
  end

  # GET /distributions/1
  # GET /distributions/1.json
  def show
    @distribution = current_user.distributions.find(params[:id])
    @letters = @distribution.letters
    @recipients = @distribution.recipients

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @distribution }
    end
  end

  # GET /distributions/new
  # GET /distributions/new.json
  def new
    @distribution = Distribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @distribution }
    end
  end

  # GET /distributions/1/edit
  def edit
    @distribution = current_user.distributions.find(params[:id])
  end

  # POST /distributions
  # POST /distributions.json
  def create
    @distribution = Distribution.new(params[:distribution])
    @distribution.user_id = current_user.id

    respond_to do |format|
      if @distribution.save
        import_csv_if_exist(@distribution)
        format.html { redirect_to @distribution, notice: t('distribution_was_successfully_created') }
        format.json { render json: @distribution, status: :created, location: @distribution }
      else
        format.html { render action: "new" }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /distributions/1
  # PUT /distributions/1.json
  def update
    @distribution = current_user.distributions.find(params[:id])

    respond_to do |format|
      if @distribution.update_attributes(params[:distribution])
        import_csv_if_exist(@distribution)
        format.html { redirect_to @distribution, notice: t('distribution_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributions/1
  # DELETE /distributions/1.json
  def destroy
    @distribution = current_user.distributions.find(params[:id])
    @distribution.destroy

    respond_to do |format|
      format.html { redirect_to distributions_url }
      format.json { head :no_content }
    end
  end

  def remove_mailing_recipients(id=nil)
    id ||= params[:id]
    @distribution = current_user.distributions.find(id)
    @distribution.recipients = []
    redirect_to @distribution, notice: t('recipients_successfully_removed')
  end

  private

  def import_csv_if_exist(distribution)
    distribution.attachments.each do |a|
      Distribution.import_csv(a, distribution.id, current_user.id)
    end
    distribution.attachments.destroy_all unless distribution.attachments.blank?
  end

end
