# Pow! Pow! Me!

Pow Pow Me is the ultimate winter holiday booking assistant, designed for 
the instant gratification generation. Pow Pow Me searches millions of possible 
holidays cross referencing your preference with snowfall reports and projections
to deliver the best possible powder.

This project was created as an example for the conference talk _Behaviour-Driven
Development with Calabash_.

# Requirements

Pow! Pow! Me! is an iOS 7 application built with Calabash and Xcode 5.

 - Xcode 5
 - Ruby 1.9.2 or later
 - Calabash-iOS

If you wish to run Pow! Pow! Me on your own iOS device, you will also require
and active iOS Developer Account with Apple. Running the app within the
iOS simulator does not require any provisioning profiles to be setup.

## Install Xcode 5 and Command Line Tools

Install Xcode 5 from the Mac App Store. Then install the Xcode Command Line
Tools when prompted.

## Install Calabash and Cucumber

Once Xcode 5 is installed, install Calabash-iOS and Cucumber from the command
line;

```
% sudo gem install calabash-cucumber
```

To check that Calabash-iOS has been installed correctly, run the following
command from your terminal;

```
% calabash-ios version
0.9.168
```

If you do not see the version output or another error, try and install
calabash and cucumber again.

It is important to run the `gem install` command as super user otherwise the
command will most likely fail.

# Usage

Check out the Pow Pow Me project from Github. Launch Xcode and open the project.
Clean and build the `Pow Pow Me-cal` target and then run. Assuming everything
built correctly the following should be printed to the console;

```
2014-06-26 11:19:40.300 Pow Pow Me-cal[67212:60b] Creating the server: <LPHTTPServer: 0x9f67d60>
2014-06-26 11:19:40.302 Pow Pow Me-cal[67212:60b] Calabash iOS server version: 0.9.168
2014-06-26 11:19:40.302 Pow Pow Me-cal[67212:60b] simroot: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk
2014-06-26 11:19:40.304 Pow Pow Me-cal[67212:60b] Started LPHTTP server on port 37265
2014-06-26 11:19:40.408 Pow Pow Me-cal[67212:60b] Cannot find executable for CFBundle 0xab848a0 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)
2014-06-26 11:19:40.410 Pow Pow Me-cal[67212:60b] Cannot find executable for CFBundle 0xab871d0 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/GeoServices.axbundle> (not loaded)
2014-06-26 11:19:41.126 Pow Pow Me-cal[67212:1903] Bonjour Service Published: domain(local.) type(_http._tcp.) name(Calabash Server)
```

To run the acceptable tests, open a terminal session and navigate to the project
directory for `Pow Pow Me`. When ready, execute the `cucumber` command and the
acceptance tests should run. If the simulator was already running there may be
a notice that the iOS Simulator could not start. Just close the running iOS 
simulator and enter `cucumber` again.

## App Bundle Issues

If you encounter issues with the tests failing as they cannot connect to the
Calabash server, it is likely that calabash is unable to locate the correct
`APP_BUNDLE_PATH` environment setting.

The `APP_BUNDLE_PATH` is the location that the project builds the target into.
This is usually `~/Library/Developer/Xcode/DerivedData/{app name}/Build/Products/Debug-iphonesimulator/{app name}.app`

In these cases you have two options;

 - Export a new `APP_BUNDLE_PATH` that references the correct path
 - Edit the `features/support/01_launch.rb` and uncomment line 20, then update
   the app path to match the location of `Pow Pow Me-cal.app`.

# License

Written by Sam de Freyssinet

The code in this project is licensed under a Creative Commons Attritrubution-
Non-Commercial-ShareAlike Licence. Full details can be found in this projects
LICENCE.md file.
