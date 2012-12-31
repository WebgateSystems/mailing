# encoding: utf-8
class LettersController < ApplicationController
  before_filter :require_login, :check_config
  # GET /letters
  # GET /letters.json
  def index
    @letters = current_user.letters

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @letters }
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  def send_letter
    @letter = current_user.letters.find(params[:id])
    @letter.send_for_all_recipients(current_user) if @letter
    redirect_to letters_path
  end

  def show
    @letter = current_user.letters.find(params[:id])
    @recipients = @letter.recipients

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/new
  # GET /letters/new.json
  def new
    @letter = Letter.new
    @distributions = current_user.distributions.where('status_id < 6')
    if params[:id]
      id = params[:id]
      @distribution = id if @distributions.detect(Distribution.find id)
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/1/edit
  def edit
    @letter = current_user.letters.find(params[:id])
    @distribution = @letter.distribution.id
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(params[:letter])
    @letter.user_id = current_user.id

    respond_to do |format|
      if @letter.save
        @letter.update_mailing_recipients
        format.html { redirect_to @letter, notice: t('letter_was_successfully_created') }
        format.json { render json: @letter, status: :created, location: @letter }
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /letters/1
  # PUT /letters/1.json
  def update
    @letter = current_user.letters.find(params[:id])
    @letter.update_mailing_recipients

    respond_to do |format|
      if @letter.update_attributes(params[:letter])
        format.html { redirect_to @letter, notice: t('letter_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter = current_user.letters.find(params[:id])
    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end
end
