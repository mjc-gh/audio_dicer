module AudioDicer
  class Context
    attr_reader :source_options, :albums

    def initialize
      @albums = []
      @source_options = {}
    end

    def source(source)
      @source_options.update source: source
    end

    def bitrate(bitrate)
      @source_options.update bitrate: bitrate
    end

    def album(&block)
      album = Album.new
      album.instance_eval(&block)

      @albums << album
    end

    alias :disc :album
  end
end
