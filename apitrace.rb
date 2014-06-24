require "formula"

#                /usr/local/Library/Contributions/example-formula.rb

class Apitrace < Formula
  homepage "http://apitrace.github.io"
  url "https://github.com/apitrace/apitrace/archive/5.0.tar.gz"
  version "5.0"
 
  head do
    url "https://github.com/apitrace/apitrace.git"
  end

  option "with-gui", "Build with gui support"
  
  depends_on "qt" if build.with? "gui"
  depends_on "qjson" if build.with? "gui"
  depends_on "cmake" => :build
  depends_on "python" => :build

  def install
    args = std_cmake_args
    args << "-DENABLE_GUI=TRUE" if build.with? "gui"
    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    system "false"
  end
end
