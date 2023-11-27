class Article < Sequel::Model
  plugin :validation_helpers
  plugin :active_model
  one_to_many :comments

  def add_comment(params)
    comments_dataset.insert(params.to_h)
  end

  def validate
    super
    validates_presence :title
    validates_presence :body
    validates_min_length 10, :body
  end

  def to_model
    self
  end

  # validates :body, presence: true, length: { minimum: 10 }
end
