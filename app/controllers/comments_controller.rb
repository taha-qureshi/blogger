class CommentsController < ApplicationController
    include CommentsHelper
    
    before_action :require_login, except: [:create]

    def require_login 

        unless logged_in? ==  true
            redirect_to root_path
        end


    end

    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save

        redirect_to article_path(@comment.article)
    end

end
