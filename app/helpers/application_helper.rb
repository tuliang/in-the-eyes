module ApplicationHelper
  def file_url_helper(image, thumb = false)
    return "image-#{Image.image_types.key(image.image_type)}.jpg" unless image.file.attached?

    if thumb
      image.image_thumb_url("image/resize,h_600")
    else
      image.file.service_url
    end
  end

  def flash_class_helper(level)
    case level
      when 'notice' then "alert alert-info alert-dismissible"
      when 'success' then "alert alert-success alert-dismissible"
      when 'error' then "alert alert-danger alert-dismissible"
      when 'alert' then "alert alert-warning alert-dismissible"
    end
  end
end
