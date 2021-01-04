class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.all
        options = {
            include: [:user, :recipe]
        }
        render json: CommentSerializer.new(comments, options)
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            options = {
                include: [:user, :recipe]
            }
            render json: CommentSerializer.new(comment, options)
        else
            render json: comment.errors, status: :unprocessable_entity
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :recipe_id)
    end
end
