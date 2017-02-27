fastlane_version "1.109.0"

default_platform :ios

lane :beta do
  # build your iOS app
  gym(
    workspace: "Alarm/Alarm.xcworkspace",
    scheme: "Alarm"
  )

  # upload to Beta by Crashlytics
  # crashlytics(
  # api_token: "86bf271a95275db9bed14c5a063edbeac7622635",
  # build_secret: "ee3fa45fd6e1296f88297acd1281248b587d91ed8c292b82c73e1d3beeaa2c62"
  # )
end
