module AudioDicer
  class Runner
    attr_reader :ctx

    def initialize(ctx)
      @ctx = ctx
    end

    def self.bin_available?(name)
    end

    # kind of lame but w/e
    def expand_relative_file(*args)
      AudioDicer.expand_relative_file(*args)
    end

    def run
      src_opts = ctx.source_options

      # First convert the video to a wav
      puts '[*] Extracting audio'
      system "mplayer -really-quiet -vc null -vo null -nocorrect-pts -ao pcm:waveheader #{expand_relative_file src_opts[:source]}"

      abort '[!] mplayer failed' unless File.exist?(expand_relative_file('audiodump.wav'))

      # Now convert that to one big mp3
      puts '[*] Convert WAV to MP3'
      system "lame -h -b #{src_opts[:bitrate] || 192} audiodump.wav audiodump.mp3"

      abort '[!] lame failed' unless File.exist?(expand_relative_file('audiodump.mp3'))

      # Now split that mp3 using out data
      ctx.albums.each do |album|
        opts = album.options

        puts "[*] Spliting #{album.tracks.size} tracks"

        # TODO allow stop to be optional (even splits)
        # TODO allow last track to use EOF
        album.tracks.each.with_index do |track, index|
          start, stop = track[:time].map { |t| t.sub ':', '.' }
          tags = "@a=#{opts[:artist].inspect},@b=#{opts[:name].inspect},@t=#{track[:title].inspect}"

          system "mp3splt -Qf -g [#{tags}] -o '#{index+1} @a - @t' audiodump.mp3 #{start} #{stop}"
        end
      end

      # Now cleanup
      puts '[*] Complete!'

    rescue SystemExit => e
      # Always clean up potental trash
      File.unlink(*%w[wav mp3].map { |ext| "audiodump.#{ext}" }) rescue nil

      raise e # raise to exit
    end
  end
end
