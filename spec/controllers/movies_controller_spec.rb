require 'spec_helper'

describe MoviesController do
  before (:all) do
    @movie = Movie.create!({:title=>"Test", :rating=>"G", :director=>"Test", :release_date=>"23-Mar-2012"})
  end
  
  it "renders the show template" do
    get :show, :id=>1
    response.should render_template("show")
    #response.should have_content("Released on: March 23, 2012")
  end
  
  it "renders the index template" do
    get :index
    response.should render_template("index")
    get :index, :sort=>"title"
    #response.should render_template("index")
    #response.should include_text("<th class='hilite'>")
    get :index, :sort=>"release_date"
  end
  
  it "should create new movie" do
    post :create, :title=>"Test 2", :rating=>"G", :director=>"Test 2", :release_date=>"23-Mar-2012"
    response.should redirect_to(movies_path)
  end
  
  it "should destroy movie" do
    post :destroy, :id => @movie.id
    response.should redirect_to(movies_path)
  end
  
  it "should show movies with the same director" do
    get :similar, :id => @movie.id
    response.should be_success
  end
  
  it "renders the edit template" do
    get :edit, :id => @movie.id
    response.should render_template("edit")
  end
  
  it "should update movie" do
    post :update, :id=>@movie.id, :title=>"Test 2", :rating=>"G", :director=>"Test 2", :release_date=>"23-Mar-2012"
    response.should redirect_to(movie_path(@movie))
  end
  
  after (:all) do
    @movie = nil
  end
end