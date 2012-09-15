class Letter
  include Mongoid::Document
  include Mongoid::Document::Taggable
  include Mongoid::Timestamps::Created

  field :contents, type: String
  field :vote_count, type: Integer, default: 0
  field :root_id, type: String
  field :child_ids, type: Array, default: []

  after_create :manage_related
  def manage_related
    if root
      root.child_ids.push self.id
      root.save
    end
  end
  private :manage_related

  def vote!
    inc(:vote_count, 1)
  end

  def vote_key
    "vote_#{id}"
  end

  def root
    @root ||= (root_id ? self.class.find(root_id) : nil)
  end

  def root?
    @root.nil?
  end

  def children
    @children ||= self.class.find(child_ids)
  end

  def related_letters
    root ? root.children : children
  end
end
