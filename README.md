# image_croper_flutter

A new Flutter project.

## Getting Started


### Add Dedepencies
> image_cropper: any
> image_picker: any


## For IOS Image picker
> add this in info.plist
> <key>NSPhotoLibraryUsageDescription</key>
<string>This App required to access the storage</string>
<key>NSCameraUsageDescription</key>
<string>This App required to access the storage</string>



## For Android Image_crop

> add this lines in src/main/androidmanifest
> <activity
android:name="com.yalantis.ucrop.UCropActivity"
android:screenOrientation="portrait"
android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>



## add Android Permission
> add this lines in src/main/androidmanifest
> <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
