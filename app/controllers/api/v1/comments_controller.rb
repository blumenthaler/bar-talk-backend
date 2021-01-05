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

    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json:  { data: "Comment successfully destroyed" }, status: :ok
        else
            error_resp = {
              error: "Comment not found and not destroyed"
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :recipe_id)
    end
end
