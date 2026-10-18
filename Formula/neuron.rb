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
      sha256 "386e6b2a534a44d9ed73ec0de3acf399bb3e71c7b40e704fe219ff51ee9b5522"
    else
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_darwin_amd64.tar.gz"
      sha256 "852d5f371e57d69a51c4bc82e7a4853d1276740e4bf656f1aa5cdd4a770b3fd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_linux_arm64.tar.gz"
      sha256 "9172b42365f0e2936fc43bb07731712399432227af7b6b78ead0097d8c55a570"
    else
      url "https://github.com/ranscky/neuron/releases/download/v0.1.0/neuron_0.1.0_linux_amd64.tar.gz"
      sha256 "829bb13a0ef9b81af41e50ddf0057ffceaa286c6841f65f482d7354fa6300c74"
    end
  end

  def install
    bin.install "neuron"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/neuron version")
  end
end
