class Comment
  attr_accessor :content, :created_at
  attr_reader :post_id, :author_id
  
  def initialize(row)
    @content    = row[0]
    @created_at = row[1]
    @post_id    = row[2]
    @author_id  = row[3]
  end
  
  def formatted_content
    "#{content}\n#{created_at.strftime('%A, %b %d')} | by #{author.name}"
  end
  
  def post
    Post.find(@post_id)
  end
  
  def author
    Author.find(@author_id) unless anonymous?
  end
  
  def anonymous?
    @author_id.nil?
  end
  
  def self.find_by_post(id)
    all.find_all { |comment| comment.post_id == id }
  end
  
  def self.all
    CSV.read('path/to.csv').map {|row| Comment.new(row) }
  end
  
end
