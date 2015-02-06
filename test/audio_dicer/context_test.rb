require 'minitest_helper'

class AudioDicerContextTest < Minitest::Test
  setup do
    @ctx = AudioDicer::Context.new
  end

  test "source sets options" do
    @ctx.source 'abc'

    assert_equal 'abc', @ctx.source_options[:source]
  end

  test "bitrate set options" do
    @ctx.bitrate 196

    assert_equal 196, @ctx.source_options[:bitrate]
  end

  test "album initializes new Album" do
    @ctx.album {}

    assert_instance_of AudioDicer::Context::Album, @ctx.albums.first
  end
end
