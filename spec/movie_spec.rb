require 'spec_helper'

describe "Movie ratings dictionary" do
  it "should contain G rating" do
    @ratings = Movie.all_ratings
    @ratings.should == %w(G PG PG-13 NC-17 R)
  end
end