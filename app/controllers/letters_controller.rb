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

  def new
    render layout: "landing_layout"
  end
end
