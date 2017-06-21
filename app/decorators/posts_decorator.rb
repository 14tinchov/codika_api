class PostsDecorator
  attr_accessor :posts

  def initialize(posts_collection)
    @posts = posts_collection
  end

  def as_json
    {
      posts: build_posts
    }
  end

  private
  def build_posts
    posts.inject([]) do |rtn, post|
      rtn << PostDecorator.new(post).as_json
    end
  end
end
