class HackerNews
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0'.freeze
  format :json

  class << self
    def user(id)
      get("/user/#{id}.json")
    end

    def item(id)
      get("/item/#{id}.json")
    end
  end
end
