require './lib/bookmarks.rb'

describe Bookmarks do
  describe "#all" do
    it "should return all bookmarks held in the instance" do
      expect(Bookmarks.all.length).to eql(2)
      expect(Bookmarks.all.first).to be_a Bookmarks
      expect(Bookmarks.all.first.title).to eq 'Reddit'
      expect(Bookmarks.all.first.url).to eq 'http://www.reddit.com' 
    end
  end
  describe "#add" do
    it "add bookmark to the database" do
      Bookmarks.add("www.testurl.com", "test")
      expect(Bookmarks.all.length).to eql(3)
      expect(Bookmarks.all.last).to be_a Bookmarks
      expect(Bookmarks.all.last.title).to eq 'test'
      expect(Bookmarks.all.last.url).to eq 'www.testurl.com' 
    end
  end
end
