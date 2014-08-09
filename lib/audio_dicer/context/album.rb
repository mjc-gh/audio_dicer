module AudioDicer
  class Context
    class Album
      attr_reader :options, :tracks

      def initialize
        @tracks = []
        @options = {}
      end

      def artist(artist)
        @options.update(artist: artist);
      end

      def name(name)
        @options.update(name: name)
      end

      def track(title, *time)
        @tracks << { title: title, time: time }
      end
    end
  end
end
