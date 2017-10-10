class Member
  attr_reader :role, :party, :district

  def initialize(attrs = {})
    @attrs = attrs
    @role = attrs[:role]
    @party = attrs[:party]
    @district = attrs[:district]
  end

  def name
    "#{attrs[:first_name]} #{attrs[:last_name]}"
  end

  private
    attr_reader :attrs
end

