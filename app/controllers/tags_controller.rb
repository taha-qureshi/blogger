class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
    end
    def index
        @tags = Tag.all

    end

    before_action :require_login, only: [:destroy]
    def require_login
        unless logged_in? == true
            redirect_to root_path
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy

        redirect_to tags_path
    end
end
