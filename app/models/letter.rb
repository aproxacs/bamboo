class Letter
  include Mongoid::Document
  include Mongoid::Document::Taggable

  field :contents, type: String
end
