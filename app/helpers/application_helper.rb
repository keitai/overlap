module ApplicationHelper
  
  def video_url(source)
    URI.join(root_url, video_path(source))
  end
  
  
end
