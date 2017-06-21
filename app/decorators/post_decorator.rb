class PostDecorator
  attr_accessor :post

  def initialize(post)
    @post = post
  end

  def as_json
    {
      id: post.id,
      title: post.title,
      body: post.body
    }
  end
end
