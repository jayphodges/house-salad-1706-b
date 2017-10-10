class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    conn.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
    response = conn.get("/congress/v1/members/house/#{params[:state]}/current.json")
    @members = JSON.parse(response.body, symbolize_names: true)[:results].map do |raw_member|
      byebug
      Member.new(raw_member)
    end


    # @members = Member.all_by_state(params[:state])
  end
end

