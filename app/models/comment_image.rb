class CommentImage < ApplicationRecord
    belongs_to :comment
    attachment :image
end
