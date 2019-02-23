class MoviesController < ApplicationController
  def index   
    @film = Movie.all   
 end   
 def show
   @film = Movie.find(params[:id])
end 
 def new   
    @film = Movie.new   
 end    

 def create   
    @film = Movie.new(movie_params)   
       
    if @film.save   
       redirect_to movies_path, notice: "Successfully uploaded."   
    else   
       render "new"   
    end   
       
 end   
    
 def destroy   
    @film = Movie.find(params[:id])   
    @film.destroy   
    redirect_to movies_path, notice:  "Successfully deleted."   
 end  
 def edit
   @film = Movie.find(params[:id])
end

def update
   @film = Movie.find(params[:id])
   if @film.update(movie_params)
       flash[:notice] ="Todo updated successfully!"
       redirect_to movie_path(@film)
   else
       render 'edit'
   end

end 
    
 private   
    def movie_params   
    params.require(:movie).permit(:title, :category, :year, :price, :attachment)   
 end   
    
end  