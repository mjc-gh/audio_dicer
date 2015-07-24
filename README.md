# AudioDicer

Simply utility to split an MP3 file into many MP3 files using a simple Ruby DSL.

## Dependencies

You'll need the following programs for `audio_dicer` to function:

    apt-get install mplayer lame mp3splt

## Installation

Add this line to your application's Gemfile:

    gem 'audio_ripper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install audio_ripper

## Usage

Here's a quick example of how the DSL works. You must first specify, a
`source` and optional `bitrate`. Next you can define one more `album` with one
or more `track` each.

    source 'your-video.mp4'
    bitrate 196

    album do
      artist 'Dr. Dog'
      name "Juan's Basement"

      track 'Say Something', '2:20', '5:36'
      track 'Worst Trip', '9:50', '12:55'
      track "Ain't it Strange", '15:27', '20:05'
      track 'Die Die Die', '22:00', '25:55'
    end

Now to run the program, simply execute:

    audio_dicer my_script.rb

## Contributing

1. Fork it ( https://github.com/[my-github-username]/audio_ripper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
