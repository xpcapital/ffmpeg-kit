# Build and Release

For Xpcapital we only publish one package per platform instead of multiple variants including different sets of libraries. We only need the Non-GPL HTTPS variant of `ffmpeg-kit`.

We use the Github Package Registry to consume the binaries privately. Therefore the person publishing the package will need to setup the necessary credentials for GitHub first.

## Environment Setup

### GitHub private package registry

For fetching packages from the GitHub Package Registry, we need to create a personal access token (classic) with `read:packages` scope and add it in the following locations:

- For NPM, add the following to `~/.npmrc`:

  ```bash
  //npm.pkg.github.com/:_authToken=<YOUR_PERSONAL_ACCESS_TOKEN>
  @xpcapital:registry=https://npm.pkg.github.com/
  ```

- For Gradle, add the following to `~/gradle.properties`:

  ```bash
  gpr.user=<YOUR_GITHUB_EMAIL>
  gpr.key=<YOUR_PERSONAL_ACCESS_TOKEN>
  ```

## Private CocoaPods repository

Add private xpcapital CocoaPods repo:

```bash
pod repo add xpcapital-ffmpeg-kit-ios-https git@github.com:xpcapital/CocoaPodsSpecs.git
```

## iOS

### Building

```bash
./ios.sh -x --disable-arm64e
```

After the command succeeded, there should be a `bundle-apple-xcframework-ios` folder under `./prebuilt`.

### Releasing

Lint podspec and test if it's valid.

```bash
pod spec lint xpcapital-ffmpeg-kit-ios-https.podspec
```

Push pod to private registry:

```bash
pod repo push xpcapital-ffmpeg-kit-ios-https xpcapital-ffmpeg-kit-ios-https.podspec
```

## Android

### Building

```bash
./android.sh --disable-arm-v7a
```

After the command succeeded, there should be a `bundle-android-aar` folder under `./prebuilt`.

### Releasing

Go to `./android` and run the following command:

```bash
./gradlew publish
```
