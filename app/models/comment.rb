class Comment < Sequel::Model
  plugin :validation_helpers
  plugin :active_model
  many_to_one :article
  def validate
    super
  end

  def to_model
    self
  end
end
