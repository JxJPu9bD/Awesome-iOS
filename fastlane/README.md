fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios lint
```
fastlane ios lint
```
最终还是使用git的提交版本作为打包的build号

Use OCLint
### ios app_debug
```
fastlane ios app_debug
```
Submit a new local Build to Pgyer

This will also make sure the profile is up to date
### ios app_release
```
fastlane ios app_release
```
Submit a new release Build to Pgyer

This will also make sure the profile is up to date

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
