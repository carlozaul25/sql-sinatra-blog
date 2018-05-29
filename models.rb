class User < ActiveRecord::Base
  has_many :blogs
end

class Comment < ActiveRecord::Base
end
