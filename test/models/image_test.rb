require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "eyes" do
  	images(:eye)

  	Image.eyes.each do |image|
      assert_equal(image.image_type, Image.image_types[:eye])
  	end
  end

  test "pictures" do
  	images(:picture)

  	Image.pictures.each do |image|
      assert_equal(image.image_type, Image.image_types[:picture])
  	end
  end

  test "photos" do
  	images(:photo)

  	Image.photos.each do |image|
      assert_equal(image.image_type, Image.image_types[:photo])
  	end
  end

  test "emoticons" do
  	images(:emoticon)

  	Image.emoticons.each do |image|
      assert_equal(image.image_type, Image.image_types[:emoticon])
  	end
  end
end
