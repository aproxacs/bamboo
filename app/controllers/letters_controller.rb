class LettersController < ApplicationController
  def index
    @letters = Letter.order_by(:created_at.desc).all page: params[:page]
  end

  def create
    @letter = Letter.new params[:letter]
    @letter.save!

    respond_to do |format|
      format.html {redirect_to letters_path}
      format.js
    end
  end

  def vote
    @letter = Letter.find params[:id]
    if session[@letter.vote_key] == true
      @message = I18n.t("letter.already_voted")
      @voted = false
    else
      @letter.vote!
      session[@letter.vote_key] = true
      @message = I18n.t("letter.vote_succeeded")
      @voted = true
    end
  end

  def new
    @samples = Letter.find(["50544938ab1ad1020000000a", "50544948ab1ad1020000000b", "50544959ab1ad1020000000c", "505449c9ab1ad1020000000d", "505449f1ab1ad1020000000e"]).map {|l| l.contents}
    render layout: "landing_layout"
  end
end
