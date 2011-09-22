require 'formula'

class Raport < Formula
  homepage 'https://github.com/thefifthcircuit/raport'
  url 'https://github.com/thefifthcircuit/raport.git'
  version 'v0.0.1'

  def install
    system "make"
    bin.install "bin/raport"
  end
end
