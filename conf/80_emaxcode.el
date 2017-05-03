(require 'emaXcode)
(setq emaXcode-xcode:sdkpath "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk")
(setq xcode:foundation (concat emaXcode-xcode:sdkpath "/System/Library/Frameworks/Foundation.framework/Headers/"))
(setq emaXcode-yas-objc-header-directories-list (list xcode:foundation))
