class Reply < Post
  belongs_to :post

  def policy_class
    'PostPolicy'
  end
end
