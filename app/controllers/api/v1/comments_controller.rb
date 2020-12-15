class Api::V1::CommentsController < ApplicationController
    def index
        @comment = Comment.all
    
        render json: @comment
    end
end
