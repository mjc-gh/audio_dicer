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

      def track(title, *times)
        case times.size
        when 2 then start, stop = times
        when 1
          start = tracks.empty? ? '0:00' : tracks.last[:stop]
          stop = times.first

        else raise ArgumentError, "2..3 arguments"
        end

        @tracks << { title: title, start: start, stop: stop }
      end
    end
  end
end
