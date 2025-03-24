require "json"

Pod::Spec.new do |s|
  s.name         = "ffmpeg-kit-ios-https"
  s.version      = "6.0.2"
  s.summary      = "FFmpeg Kit iOS Https Shared Framework"
  s.description  = "Includes FFmpeg with gmp and gnutls libraries enabled."
  s.homepage     = "https://github.com/mygroove/ffmpeg-kit-private"
  s.license      = "LGPL-3.0"
  s.authors      = "MyGroove"

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/mygroove/ffmpeg-kit-private.git", :tag => "6.0.2" }

  s.libraries = [
    "z",
    "bz2",
    "c++",
    "iconv"
  ]

  s.frameworks = [
    "AudioToolbox",
    "AVFoundation",
    "CoreMedia",
    "VideoToolbox"
  ]
  s.vendored_frameworks = [
    "prebuilt/bundle-apple-xcframework-ios/ffmpegkit.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libavcodec.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libavdevice.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libavfilter.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libavformat.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libavutil.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libswresample.xcframework",
    "prebuilt/bundle-apple-xcframework-ios/libswscale.xcframework",
  ]
end
