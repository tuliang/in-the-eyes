require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  setup do
    @user = User.create!(email: "#{rand(50000)}@example.com", password: "password")
    @image = Image.create!(title: "#{rand(50000)}-tiele", image_type: Image.image_types[:eye], user_id: @user.id)
  end

  test "image validates" do
    image = Image.new

    assert image.invalid?
    assert image.errors[:title].any?
    assert image.errors[:image_type].any?
    assert image.errors[:user_id].any?
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

  test "room" do
    image = images(:demo)
    image.save

    assert_equal(image.room, "#{image.class.name.downcase}_#{image.id}")
  end

  test "up_hits" do
    @image.up_hits

    assert_equal(@image.hits, 1)

    hits = rand(10)

    hits.times do
      @image.up_hits
    end
    
    assert_equal(@image.hits, 1+hits)
  end

  test "hits" do
    assert_equal(@image.hits, 0)
  end

  test "key" do
    image = images(:demo)
    image.save

    assert_equal(image.key, "#{image.class.name.downcase}_#{image.id}")
  end
end
