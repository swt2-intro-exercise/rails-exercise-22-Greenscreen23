class AuthorsController < ApplicationController
    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)

        if not @author.save
            render 'new'
            return
        end

        redirect_to @author
    end

    def show
        @author = Author.find(params[:id])
    end

    def index
        @authors = Author.all
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
        @author = Author.find(params[:id])

        if not @author.update(author_params)
            render 'edit'
            return
        end

        redirect_to @author
    end

    def destroy
        @author = Author.find(params[:id])

        @author.destroy
    end

private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
