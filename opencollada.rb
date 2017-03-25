class Opencollada < Formula
  desc "Stream based reader and writer library for COLLADA files"
  homepage "http://www.opencollada.org"
  url "https://github.com/KhronosGroup/OpenCOLLADA/archive/v1.6.43.tar.gz"
  sha256 "b677c7195ef1948b0cd4e70b27fbe33656935e2ff3136cc22db874cb94e4d4bd"

  bottle do
    cellar :any_skip_relocation
    sha256 "1377a65ba06de2ea1b0488e400628b6d4a1452a9bdb2647d97f6c3d9b372932d" => :sierra
    sha256 "998b98a95597f6931e9d75b5f76bc691bb0b40b1973b5eef874ab2c212304229" => :el_capitan
    sha256 "3a784ce53250eb4b6b7095efd188e65d53a91994968ad5879cec367080e6fd19" => :yosemite
  end

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
      prefix.install "bin"
      Dir.glob("#{bin}/*.xsd") { |p| rm p }
    end
  end

  test do
    system "#{bin}/OpenCOLLADAValidator"
  end
end
