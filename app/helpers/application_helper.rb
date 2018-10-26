module ApplicationHelper
  def file_url_helper(image)
    if image.file_url.present?
      image.file_url
    else
      "image-#{Image.image_types.key(image.image_type)}.jpg"
    end
  end
end
