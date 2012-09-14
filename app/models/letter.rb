class Letter
  include Mongoid::Document
  include Mongoid::Document::Taggable
  include Mongoid::Timestamps::Created

  field :contents, type: String
end
