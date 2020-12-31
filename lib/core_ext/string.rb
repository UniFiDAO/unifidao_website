class String
  def to_http
    return self if self.include?("http") || self.include?("https")

    "http://" + self
  end

  def to_you_tube_id
    get_youtube_id(self)
  end
end

def get_youtube_id(url)
  id = ''
  url = url.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
  if url[2] != nil
    id = url[2].split(/[^0-9a-z_\-]/i)
    id = id[0];
  else
    id = url;
  end
  id
end
