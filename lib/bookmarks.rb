require 'pg'

class Bookmarks
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all

      con = db_connect
      rs = con.exec "SELECT * FROM bookmarks"

      rs.map do |bookmark|
        Bookmarks.new(id: bookmark["id"], url: bookmark["url"], title: bookmark["title"])
      end
      
      # array =[]
  
      # rs.each do |row|
      #   array << {url: row["url"], title: row["title"] }
      # end

      # db_con_cleanup(rs, con)

  end

  def self.add(url, title)
      con = db_connect
      rs = con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')"
      # db_con_cleanup(rs, con)
  end

  private

  def self.db_connect
    user = 'arav'
    # password = '123'

    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'bookmark_manager_test', :user => user

    else
      PG.connect :dbname => 'bookmark_manager', :user => user
    end

  end

  def self.db_con_cleanup(rs, con)
    rs.clear if rs
    con.close if con
  end

end



