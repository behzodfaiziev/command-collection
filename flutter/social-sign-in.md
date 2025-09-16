# Google & Apple Sign-In Integration (Flutter + Firebase + GCP)

This guide outlines the steps to integrate **Google** and **Apple** Sign-In in a Flutter project using **Firebase Authentication** and **Google Cloud Platform (GCP)**, for both **iOS** and **Android** platforms.

---

## ✅ Firebase & GCP Setup

### 1. Create Firebase Project

- Go to [Firebase Console](https://console.firebase.google.com)
- Create or select a project

---

### 2. Enable Authentication Providers

- Navigate to **Authentication > Sign-in method**
- Enable:
  - ✅ **Google**
  - ✅ **Apple** (for iOS)

---

### 3. Enable APIs in GCP

- Go to [GCP Console](https://console.cloud.google.com)
- Select the **Firebase project**
- Enable:
  - `Google Identity Services API`
  - `OAuth 2.0 API`

---

### 4. Create OAuth 2.0 Credentials (Backend)

- Go to **APIs & Services → Credentials**
- Click **Create Credentials → OAuth 2.0 Client ID**
- Select **Web application**
- Add redirect URI(s)
- Copy:
  - `GOOGLE_OAUTH_CLIENT_ID`
  - `GOOGLE_OAUTH_CLIENT_SECRET`

---

### 5. Register iOS and Android Apps in Firebase

#### iOS:
- Add **Bundle ID**
- Download `GoogleService-Info.plist`
- Place in `ios/Runner/`

#### Android:
- Add **Package name + SHA-1**
- Run `./gradlew signingReport` to get SHA-1
- Download `google-services.json`
- Place in `android/app/`

---

## ✅ iOS Configuration

### 1. Update `Info.plist` (Google)

```xml
<key>GIDClientID</key>
<string>[CLIENT_ID]</string>

<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>[REVERSED_CLIENT_ID]</string>
    </array>
  </dict>
</array>
```

### 2. Enable Apple Sign-In

- Open in Xcode
- Go to `Signing & Capabilities`
- Add **Sign In with Apple**

---

## ✅ Android Configuration

### 1. Add SHA-1/256 to Firebase
```bash
./gradlew signingReport
```

### 2. Update Gradle

**`android/build.gradle`**
```gradle
classpath 'com.google.gms:google-services:4.4.0'
```

**`android/app/build.gradle`**
```gradle
apply plugin: 'com.google.gms.google-services'

dependencies {
  implementation 'com.google.android.gms:play-services-auth:20.7.0'
}
```

---

## ✅ Backend Integration (NestJS)

```ts
const ticket = await oauth2Client.verifyIdToken({
  idToken: token,
  audience: [
    'firebase-ios-client-id.apps.googleusercontent.com',
    'firebase-android-client-id.apps.googleusercontent.com',
    'web-client-id.apps.googleusercontent.com'
  ]
});
```

---

## ✅ Security Notes

- ❌ Do **not** use `client_secret` in frontend
- ✅ Backend must verify `idToken` against correct `aud` (audience)
- ✅ Accept mobile-generated tokens by including mobile Firebase client IDs

---
