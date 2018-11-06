require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "image validates" do
    image = Image.new

    assert image.invalid?
    assert image.errors[:title].any?
    assert image.errors[:image_type].any?
    assert image.errors[:user_id].any?
    assert image.errors[:file].any?
  end

  test "image validates title" do
    title = "s" * 21
    image = Image.new(title: title)

    assert image.invalid?
    assert image.errors[:title].any?
  end

  test "image validates image_type" do
    image = Image.new(image_type: -1)

    assert image.invalid?
    assert image.errors[:image_type].any?
  end

  test "image validates user_id" do
    image = Image.new(user_id: -1)

    assert image.invalid?
    assert image.errors[:user_id].any?
  end

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
