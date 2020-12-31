class String
  def to_http
    return self if self.include?("http") || self.include?("https")

    "http://" + self
  end

  def to_you_tube_id
    self.split("?v=")[1]
  end
end
