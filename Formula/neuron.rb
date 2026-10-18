# Homebrew formula for the Neuron CLI.
#
# This is a template. .github/workflows/release.yml fills in the version and the
# sha256 of each archive, attaches the rendered formula to the release as
# `neuron.rb`, and scripts/publish-tap.sh copies it into a tap.
#
# Install straight from a tap once it exists:
#   brew install ranscky/neuron/neuron
class Neuron < Formula
  desc "MCP control plane for developers — one manifest, every AI client"
  homepage "https://github.com/ranscky/neuron"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_darwin_arm64.tar.gz"
      sha256 "51e68cd833ed271fcc72e84cc2a2aa40714c424163a7887eacde965561891e7f"
    else
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_darwin_amd64.tar.gz"
      sha256 "310534142750589e63caa601f249c63b67c40440ffdef36eb970c0eff99146b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_linux_arm64.tar.gz"
      sha256 "a448b7491be3fc1e337a30e61ef0712632ba2ed51b4cdd096a8354189792c330"
    else
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_linux_amd64.tar.gz"
      sha256 "e29954506d1ec2d2c905b4df0333b6b1c7ac7caa089c9ce897e086a151636329"
    end
  end

  def install
    bin.install "neuron"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/neuron version")
  end
end
