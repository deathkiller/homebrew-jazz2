cask "jazz2" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  arch arm: "ARM64", intel: "x64"

  version "3.6.0"
  sha256 "6a8050653aa9d12a8680c898a55970b68b2c4d890528693cb05664bbb29e17c4"

  url "https://github.com/deathkiller/jazz2/releases/download/#{version}/Jazz2_#{version}_MacOS.zip",
      verified: "github.com/deathkiller/jazz2/"
  name "Jazz² Resurrection"
  desc "Open-source reimplementation of Jazz Jackrabbit 2"
  homepage "https://deat.tk/jazz2/"

  container nested: "#{arch}/jazz2_sdl2.dmg"

  app "Jazz² Resurrection.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Jazz² Resurrection.app"
  end

  zap trash: "~/Library/Application Support/Jazz² Resurrection"

  caveats <<~EOS
    Game data should be installed to ~/Library/Application Support/Jazz² Resurrection/Source/
  EOS
end