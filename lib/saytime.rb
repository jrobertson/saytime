#!/usr/bin/env ruby

# file: saytime.rb

require 'wavefile'


# Making the WAV files
# ======================

# The wav files were produced by saying the following in 1 continuos recording:

# the time is 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 30 40 50 am pm

# the files were then manually split into wav files using the sound editing 
# software called Audacity



class Saytime
  include WaveFile


  def initialize(filepath='')

    @filepath = filepath
    Dir.chdir filepath unless filepath.empty?

  end

  def now(wav_player='play')

    make_wav()
    `#{wav_player} time.wav`

  end

  private

  def append_wavs(wav_files, target_wav)
    
    lib = File.dirname(__FILE__)
    

    Writer.new(target_wav, Format.new(:stereo, :pcm_16, 44100)) do |writer|

      wav_files.each do |name|

        file_name = @filepath.empty? ? File.join(lib,'..','wav',name)  : \
                                                     File.join(@filepath, name)

        Reader.new(file_name).each_buffer(samples_per_buffer=4096) do |buffer|
          writer.write(buffer)
        end

      end
    end

  end

  def make_wav()

    a = ['the_time_is']
    h, m, meridiem = Time.now.strftime("%-I %M %P").split
    a << h
    a.concat (m.length > 1 and m[0] != '1' ? [m[0] + '0', m[1]] : [m])
    a << meridiem

    a.reject!{|x| x =~ /^0/}

    append_wavs(a.map{|x| x + '.wav'}, 'time.wav')

  end

end

