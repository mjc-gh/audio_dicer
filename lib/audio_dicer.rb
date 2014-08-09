require 'audio_dicer/version'
require 'audio_dicer/context'
require 'audio_dicer/context/album'
require 'audio_dicer/runner'
require 'fileutils'

module AudioDicer
  def self.expand_relative_file(file)
    File.expand_path(file, Dir.pwd)
  end

  def self.load(filename)
    File.open(expand_relative_file(filename)) do |file|
      execute file.read, filename
    end
  end

  def self.execute(script, filename = nil)
    ctx = Context.new
    ctx.instance_eval script

    Runner.new(ctx).run
  end
end
