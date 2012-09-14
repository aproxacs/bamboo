class LettersController < ApplicationController
  def index

  end

  def create
    @letter = Letter.new params[:letter]
    @letter.save!

    respond_to do |format|
      format.html {redirect_to letters_path}
      format.js
    end
  end
end
