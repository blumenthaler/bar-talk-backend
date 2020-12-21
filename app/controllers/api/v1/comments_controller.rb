class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.all
        options = {
            include: [:user, :recipe]
        }
        render json: CommentSerializer.new(comments, options)
    end
end
