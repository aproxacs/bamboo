class LettersController < ApplicationController
  def index
    @letters = @letters_recent = Letter.order_by(:created_at.desc).limit(100).all page: params[:page]
    @letters_popular = Letter.where(:created_at.gte => 1.day.ago).order_by(:vote_count.desc).all page: params[:page]
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
    @samples = Letter.find(Settings.sample_ids.split(",")).map {|l| l.contents.size > 26 ? l.contents[0..26] + ".." : l.contents}

    render layout: "landing_layout"
  end

  def related
    @letter = Letter.find params[:id]
    @related_letters = @letter.related_letters
    @related_letters.push @letter.root if @letter.root
  end
end
