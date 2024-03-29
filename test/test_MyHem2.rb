# frozen_string_literal: true

require_relative "test_helper"

class TestMyHem2 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MyHem2::VERSION
  end

  def test_jpg
    assert_equal 'JPG', MyHem2.checkfile('test.jpg')
  end

  def test_png
    assert_equal 'PNG', MyHem2.checkfile('test.png')
  end

  def test_gif
    assert_equal 'GIF', MyHem2.checkfile('test.gif')
  end
  
  def test_wav
    assert_equal 'WAV', MyHem2.checkfile('test.wav')
  end

  def test_psd
    assert_equal 'PSD', MyHem2.checkfile('test.psd')
  end

  def test_mp3
    assert_equal 'MP3', MyHem2.checkfile('test.mp3')
  end

  def test_avi
    assert_equal 'AVI', MyHem2.checkfile('test.avi')
  end

  def test_rar
    assert_equal 'RAR', MyHem2.checkfile('test.rar')
  end

  def test_pdf
    assert_equal 'PDF', MyHem2.checkfile('test.pdf')
  end
  
  def test_zip
    assert_equal 'ZIP', MyHem2.checkfile('tests.zip')
  end

  def test_mp4
    assert_equal 'MP4', MyHem2.checkfile('test.mp4')
  end
  def test_error
    begin MyHem2.checkfile('hehe.haha') rescue r = :hehe end
    assert_equal :hehe, r
  end
  def test_unknownfile
    assert_nil MyHem2.checkfile('tests.tar.xz')
  end

end
