cask "jazz2" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  arch arm: "ARM64", intel: "x64"

  version "3.8.0"
  sha256 "5a051dab4260b1bd99d2a9285242a6b062c6b5f88dba773c98b4dd786a42bab7"

  url "https://github.com/deathkiller/jazz2/releases/download/#{version}/Jazz2_#{version}_MacOS.zip"
  name "Jazz² Resurrection"
  desc "Open-source reimplementation of Jazz Jackrabbit 2"
  homepage "https://de4th.dev/jazz2/"

  depends_on :macos
  container nested: "#{arch}/jazz2_sdl2.dmg"

  app "Jazz² Resurrection.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "/Applications/Jazz² Resurrection.app"]
  end

  zap trash: "~/Library/Application Support/Jazz² Resurrection"

  caveats <<~EOS
    Game data should be installed to ~/Library/Application Support/Jazz² Resurrection/Source/
  EOS
end
