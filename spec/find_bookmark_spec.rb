describe Bookmarks do
  context "User can't find a bookmark" do
    describe "#find" do
      it "should return the bookmark as an object" do
        bookmark = Bookmarks.find("Tor")

        expect(bookmark).to be_a Bookmarks
        expect(bookmark.title).to eq("Tor")
        expect(bookmark.url).to eq("http://www.torbrowser.com")
      end
    end
  end
end