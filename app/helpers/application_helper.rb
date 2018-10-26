module ApplicationHelper
  def file_url_helper(image)
    if image.file_url.present?
      image.file_url
    else
      "image-#{Image.image_types.key(image.image_type)}.jpg"
    end
  end

  def flash_class_helper(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
