class Letter
  include Mongoid::Document
  include Mongoid::Document::Taggable
  include Mongoid::Timestamps::Created

  field :contents, type: String
  field :vote_count, type: Integer, default: 0

  def vote!
    inc(:vote_count, 1)
  end

  def vote_key
    "vote_#{id}"
  end
end
