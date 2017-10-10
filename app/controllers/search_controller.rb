class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    conn.headers["X-API-Key"] = "yQGAnrKoJi7WWVfZ4LsbCINgYlhrXrm9YrpF2zE8"
    response = conn.get("/congress/v1/members/house/CO/current.json")
    @members = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
