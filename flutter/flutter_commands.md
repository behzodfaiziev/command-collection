# Flutter Commands

Welcome to the Flutter Commands section! This document serves as a comprehensive collection of Flutter commands to assist developers in various aspects of Flutter app development.

## Table of Contents
- [Basics](#basics)
- [Development](#development)
- [iOS](#ios)
- [Android](#android)
- [Testing](#testing)
- [Internationalization](#internationalization)
- [Deployment](#deployment)

## Basics
- `flutter create`: Create a new Flutter project.
- `flutter run`: Run the Flutter application.
- `flutter pub add "package" && flutter pub get`: Add dependency
- `flutter pub add -d "package" && flutter pub get`: Add Dev dependency
- `dart fix --apply`: Fix lint issues 


## Development
- `dart run build_runner watch --delete-conflicting-outputs --use-polling-watcher`: Runner watch.

## iOS: 
- `flutter clean && flutter pub get && cd ios && pod install --repo-update && cd ..`: Clean and Update Pods for iOS

## Android: 

## Internationalization
- `dart run easy_localization:generate -O lib/product/init/lang -f keys -o locale_keys.g.dart --source-dir assets/translations`: Generate Translation from translations folder to lang folder.

## Testing
- `flutter test`: Run tests
- `flutter test --coverage && genhtml coverage/lcov.info -o coverage/html`: Run tests with coverage 
- `flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html`: Run tests with coverage and open in browser

## Deployment
- `flutter build apk --release --split-per-abi`: Build Android application for release.

