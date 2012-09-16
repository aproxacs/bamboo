class LettersController < ApplicationController
  def index
    @letters = Letter.order_by(:created_at.desc).all page: params[:page]
  end

  def show
    @letter = Letter.find params[:id]
    render layout: "letter_show"
  end

  def create
    @letter = Letter.new params[:letter]
    @letter.save!

    respond_to do |format|
      format.html {redirect_to letters_path}
      format.js
    end

    new_letter_html = render_to_string :partial => 'letter', :locals => {:letter => @letter}

    Pusher['letter'].trigger!('new_letter', {
      :tag => new_letter_html,
      :model => @letter
    })
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
    @samples = Letter.limit(5).all.map {|l| l.contents.size > 27 ? l.contents[0..27] + ".." : l.contents}
    render layout: "landing_layout"
  end

  def recent
  end
end
