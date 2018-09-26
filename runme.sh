#!/bin/bash

xcodebuild -project "VIPER TDD.xcodeproj" -scheme "VIPER TDD" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' test
