class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :blogs
end

class Comment < ActiveRecord::Base
end
=======
	has_many :blogs
end

class Blog < ActiveRecord::Base
	belongs_to :user
end


>>>>>>> 149f1dd39b0c0b3c82f90e3755fcd13bb801ca17
