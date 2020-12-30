class String
  def to_http
    return self if self.include?("http") || self.include?("https")

    "http://" + self
  end
end
