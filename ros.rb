class Ros < Formula
  desc "ros kinetic umbrella"
  homepage "http://ros.org"
  url "https://github.com/lagrange-ai/homebrew-ros/releases/download/osx-kinetic-1/osx-ros-kinetic-lagrange-1.tar.gz"
  version "kinetic-1"
  sha256 "8c6cea51fb4228c818c56dc07a5a140e5e475c77e36c804157bed33ab740f9c9"

  bottle :unneeded
  keg_only "This brew is to be activated manually."

  depends_on :python # this probably means we want python2

  # based on:
  # rosdep  keys --from-paths src | rosdep resolve \
  #   | awk -F: '$3 == "homebrew" {print "depends_on", "\""$2"\""}' \
  #   | sort -u | pbcopy
  depends_on "boost"
  depends_on "boost-python"
  depends_on "cmake" => :run
  depends_on "ros/deps/console_bridge"
  depends_on "cppunit"
  depends_on "eigen"
  depends_on "ffmpeg"
  depends_on "graphviz"
  depends_on "ros/deps/gtest"
  depends_on "jasper"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "log4cxx"
  depends_on "lz4"
  depends_on "ossp-uuid"
  depends_on "pkg-config" => :run
  depends_on "https://raw.githubusercontent.com/Homebrew/homebrew-core/b6180131029e13c2dde1de1be6d3cf78178db3d8/Formula/poco.rb"
  depends_on "protobuf"
  depends_on "py2cairo"
  depends_on "sip" => ["without-python3"]
  depends_on "pyqt5" => ["with-python", "without-python3"]
  depends_on "ros/deps/tango-icon-theme"
  depends_on "tinyxml"

  # special homebrewed versions of python deps
  depends_on "homebrew/python/pillow" => [:python, "PIL"]
  depends_on "homebrew/python/numpy" => :python
  #depends_on "homebrew/python/matplotlib" => [:python, "with-pyqt5"]

  # based on:
  # rosdep  keys --from-paths src | rosdep resolve \
  #   | awk -F: '$3 == "homebrew" {print "depends_on", "\""$2"\""}' \
  #   | sort -u | pbcopy
  # (using homebrew-pypi-poet to generate resources)
  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/02/16/f3c3867c806791bba5329bd5db80b76d08d5c6bc2cd1136be47dfd5577a0/matplotlib-2.0.0b1.tar.gz"
    sha256 "d8b261a796bdc229af2140b3dec452b4aa2fb8388196036d9b18db9f42031659"
  end
  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end
  resource "argparse" do
    url "https://files.pythonhosted.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz"
    sha256 "62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4"
  end
  resource "catkin_pkg" do
    url "https://files.pythonhosted.org/packages/13/b8/87671c4003ae2dd73e6dced6ec2cab5a8023d4baeb070acda148e0a53417/catkin_pkg-0.2.10.tar.gz"
    sha256 "d4d069eaeb29d6a9ee71773b20c41515b6e0feb9ea2765ebaf3e599d0ceef050"
  end
  resource "coverage" do
    url "https://files.pythonhosted.org/packages/2d/10/6136c8e10644c16906edf4d9f7c782c0f2e7ed47ff2f41f067384e432088/coverage-4.1.tar.gz"
    sha256 "41632b5e2c0ec510e4c0f1f0f02a702477d1f837693964390553539217c92b07"
  end
  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/09/3b/b1afa9649f48517d027e99413fec54f387f648c90156b3cf6451c8cd45f9/defusedxml-0.4.1.tar.gz"
    sha256 "cd551d5a518b745407635bb85116eb813818ecaf182e773c35b36239fc3f2478"
  end
  resource "EmPy" do
    url "https://files.pythonhosted.org/packages/b7/56/72a285d257c7791616960493a04f14c05ca1bf7a83dd208485cf991563bd/empy-3.3.2.tar.gz"
    sha256 "99f016af2770c48ab57a65df7aae251360dc69a1514c15851458a71d4ddfea9c"
  end
  resource "mock" do
    url "https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"
    sha256 "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
  end
  resource "netifaces" do
    url "https://files.pythonhosted.org/packages/18/fa/dd13d4910aea339c0bb87d2b3838d8fd923c11869b1f6e741dbd0ff3bc00/netifaces-0.10.4.tar.gz"
    sha256 "9656a169cb83da34d732b0eb72b39373d48774aee009a3d1272b7ea2ce109cde"
  end
  resource "nose" do
    url "https://files.pythonhosted.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz"
    sha256 "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
  end
  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/ce/63/cc9baa5d5b568aadaaa7c19190a9b852a0a740b478dd068137c4b0c7cb74/paramiko-2.0.0.tar.gz"
    sha256 "51219ecaf88aa1cea9952b3c4ddcc0c1316f015d23d77edb7aee78a3468ef0e2"
  end
  resource "psutil" do
    url "https://files.pythonhosted.org/packages/a6/bf/5ce23dc9f50de662af3b4bf54812438c298634224924c4e18b7c3b57a2aa/psutil-4.2.0.tar.gz"
    sha256 "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
  end
  resource "pydot" do
    url "https://files.pythonhosted.org/packages/da/9c/2ee9bed5653839c00252670b65b28c734803ff2d61e97e99ef58a4a4e715/pydot-1.1.0.tar.gz"
    sha256 "469d2cf565994064236be24e87ab3571c1c1243fbc8d2ad836d16637d1a5049b"
  end
  resource "pygraphviz" do
    url "https://files.pythonhosted.org/packages/98/bb/a32e33f7665b921c926209305dde66fe41003a4ad934b10efb7c1211a419/pygraphviz-1.3.1.tar.gz"
    sha256 "7c294cbc9d88946be671cc0d8602aac176d8c56695c0a7d871eadea75a958408"
  end
  resource "rosdep" do
    url "https://files.pythonhosted.org/packages/ae/a5/4de74df30a62823845d2707600d0d1f64afcc5268057f36e6a7917846a5d/rosdep-0.11.5.tar.gz"
    sha256 "46e072074270a1ea25411829814f4bdc1f34b358c950e9b8a7b75b4a40efd96a"
  end
  resource "rospkg" do
    url "https://files.pythonhosted.org/packages/a5/bc/2e992cfb62319a603b6d9275f4b7f0b9d5a94b9de3f013b5831617afe4c8/rospkg-1.0.39.tar.gz"
    sha256 "fc342065ede21070f45b31c355b8c554b6388265c02623550b21c6b0bc14a0d4"
  end

  def caveats; <<-EOS.undent
    See also: http://wiki.ros.org/kinetic/Installation/OSX/Homebrew/Source

    You may also want to `pip install wstool rosinstall rosinstall_generator rospkg catkin-pkg`.

    I may have done this:
      ln -sf /usr/local/share/sip/Qt5 /usr/local/share/sip/PyQt5

    To activate this ROS install add the following line to your .bashrc or equivalent:
      source #{prefix}/setup.bash
    EOS
  end

  def install
    Dir.glob("**/*.pc").concat(Dir.glob("**/*.cmake").concat(Dir.glob("**/*.sh"))).each do |f|
      begin
        inreplace f, "/usr/local/Cellar/ros/kinetic-lagrange-1", prefix if File.file?(f)
      rescue Utils::InreplaceError
        # meh
      end
    end
    prefix.install Dir["*"]
    resources.each do |r|
      r.stage do
        system "python", *Language::Python.setup_install_args(prefix)
      end
    end
  end
end
