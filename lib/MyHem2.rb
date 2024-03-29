# frozen_string_literal: true

require_relative "MyHem2/version"

module MyHem2
  class NotExistError < StandardError; end

  Formats = {[255,216] =>'JPG', [137,80,78,71] =>'PNG', [71,73,70,56] =>'GIF',[82,73,70,70,70,84]=> 'AVI', [82,73,70,70] =>'WAV', [56,66,80,83] =>'PSD', [73,68,51] =>'MP3', [82,97,114,33,26,7] => 'RAR', [37,80,68,70] => 'PDF', [80,75,3,4] => 'ZIP', [117,115,116,97,114]=>'TAR', [102,116,121,112,109,112,52,50] => 'MP4'}

  def self.checkfile(fn)
    if !(File.exist? fn)
      raise NotExistError, "Can't find the file ;("
    end
    
    f = File.new(fn,'r')
    bytess = f.readline[0,15].bytes
    byte_string = bytess.to_s
    byte_string = byte_string[1,byte_string.length-2]
    f.close  

    for i in Formats.keys do 
      t = i.to_s
      t = t[1,t.length-2]

      if byte_string.include?(t)
        return Formats[i]
      end
    end
    return nil
    end    
end
