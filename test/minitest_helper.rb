$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'audio_dicer'
require 'minitest/autorun'

class Minitest::Test
  parallelize_me!

  def self.setup(&block)
    define_method :setup, &block
  end

  def self.test(name, &block)
    define_method "test_#{name.gsub(/\s+/, '_')}", &block
  end
end
