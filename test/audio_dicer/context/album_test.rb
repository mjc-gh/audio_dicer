require 'minitest_helper'

class AudioDicerContextAlbumTest < Minitest::Test
  setup do
    @album = AudioDicer::Context::Album.new
  end

  test "artist sets options" do
    @album.artist 'Dr. Dog'

    assert_equal 'Dr. Dog', @album.options[:artist]
  end

  test "name sets options" do
    @album.name "Juan's Basement"

    assert_equal "Juan's Basement", @album.options[:name]
  end

  test "track with single arugment and empty list" do
    @album.track 'Say Something', '4:50'

    assert_equal [
      { title: 'Say Something', start: '0:00', stop: '4:50' }
    ], @album.tracks
  end

  test "tracks with two arugments and empty list" do
    @album.track 'Say Something', '1:00', '4:50'

    assert_equal [
      { title: 'Say Something', start: '1:00', stop: '4:50' }
    ], @album.tracks
  end

  test "track with single arugment and entry in list" do
    @album.track 'Say Something', '4:50'
    @album.track 'Die, Die, Die', '8:40'

    assert_equal [
      { title: 'Say Something', start: '0:00', stop: '4:50' },
      { title: 'Die, Die, Die', start: '4:50', stop: '8:40' }
    ], @album.tracks
  end

  test "tracks with two arugments and entry in list" do
    @album.track 'Say Something', '4:50'
    @album.track 'Die, Die, Die', '4:55', '8:40'

    assert_equal [
      { title: 'Say Something', start: '0:00', stop: '4:50' },
      { title: 'Die, Die, Die', start: '4:55', stop: '8:40' }
    ], @album.tracks
  end
end
