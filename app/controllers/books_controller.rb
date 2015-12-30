class BooksController < ApplicationController

	def new
    @book = @list.books.new
	end
	
	def create
		@list = List.find(params[:list_id])
		@book = @list.books.new(book_params)
		if @book.save
			flash[:success] = "Book added!"
			redirect_to list_path(@list)
		else
			flash[:error] = "You didn't fill out the entire form"
			redirect_to list_path(@list) 
		end
	end

	def show
	end

	def index
	end

	def update
	end

	def edit
	end

	def destroy
	  @list = List.find(params[:list_id])
	  @book = @list.books.find(params[:id])
	  @book.destroy
	    respond_to do |format|
	        format.html {redirect_to list_path(@list)}
	        format.js {}
	    end
	end
	
	def finish
	  @list = List.find(params[:list_id])
	  @book = @list.books.find(params[:id])
	  @book.update(finished: true)
	  	respond_to do |format|
	        format.html {redirect_to list_path(@list)}
	        format.js {}
	  	render @list
    end
  end

  def unfinish
	  @list = List.find(params[:list_id])
	  @book = @list.books.find(params[:id])
	  @book.update(finished: false)
	  	respond_to do |format|
	        format.html {redirect_to list_path(@list)}
	        format.js {}
	  	render @list
    end
  end

	private

	def book_params
      params.require(:book).permit(:name, :author, :pages)
  end


end
