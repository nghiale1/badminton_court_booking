### Source
#Update submodule libraries
git submodule update --remote

# Generate *.g.dart files
flutter pub run build_runner build

# clear cache and generate *.g.dart files
flutter pub run build_runner build --delete-conflicting-outputs

# Generate *.g.dart in core module
cd libraries/core
flutter pub run build_runner build --delete-conflicting-outputs

# Install firebase tool
download and install: https://firebase.google.com/docs/cli
firebase login
firebase projects:list --json

# if needed
firebase login --reauth

# Generate firebase_options.dart
dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure

### Android

#Copy keystore folder into the "root/android"
cp -R keystore root/android/app/

#Run
flutter run -t lib/launcher/main_dev.dart  --debug --flavor=dev

#Build
flutter build apk -t lib/launcher/main_dev.dart  --debug --flavor=dev

### iOS

# if needed
cd ios/
pod install

# Setup Firebase service
1. Open ios folder with Xcode
2. Targets -> Runner -> Build Phase: Add a new Run script (name: Setup Firebase Service)
3. Copy contents of script/setup-firebase-service.sh and paste it in the script
   Note: Add the Firebase package to Runner package if needed

#Run
flutter run -t lib/launcher/main_dev.dart  --debug --flavor=dev 
