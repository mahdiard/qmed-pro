# 🚀 QMed Pro — App Store Deployment Guide

> Complete walkthrough for publishing QMed Pro to Google Play Store and Apple App Store

---

## 📋 Prerequisites

### Required Software
- ✅ Node.js 18+
- ✅ Xcode 14+ (macOS only – required for iOS builds)
- ✅ Android Studio 2022+ (for Android builds)
- ✅ Java Development Kit (JDK) 11+ (for Android)
- ✅ Capacitor CLI: `npm install -g @capacitor/cli`

### Developer Accounts
- 💳 **Apple Developer Program** ($99/year) — https://developer.apple.com/programs
- 💳 **Google Play Developer** ($25 one-time) — https://play.google.com/console

### Certificates & Keys
- 🔐 iOS Development Certificate
- 🔐 iOS Distribution Certificate
- 🔐 Android Keystore (signing key)
- 🔐 App Store Connect credentials

---

## 🔧 Step 1: Initial Capacitor Setup (One-Time)

### 1.1 Install Capacitor Dependencies

```bash
cd qmed-pro
npm install @capacitor/core @capacitor/cli
npm install -D @capacitor/ios @capacitor/android
npm install @capacitor/app @capacitor/keyboard @capacitor/status-bar
npm install @capacitor/splash-screen @capacitor/http
```

### 1.2 Initialize Capacitor (First Time Only)

```bash
npx cap init --web-dir=out
```

When prompted, enter:
- **App name:** QMed Pro
- **App Package ID:** com.qmedpro.app
- **Web dir:** out

### 1.3 Add Platforms

```bash
npx cap add ios
npx cap add android
```

This creates `ios/` and `android/` directories with native project files.

---

## 🏗️ Step 2: Build Web App for Static Export

The Capacitor wrapper requires your Next.js app exported as static HTML/JS.

### 2.1 Build for Production

```bash
npm run build:web
```

This:
1. Builds Next.js to `out/` directory
2. Syncs web files to native projects via `npx cap sync`

### 2.2 Verify Build

```bash
ls -la out/
```

Should contain: `index.html`, `_next/`, static files

---

## 🍎 Step 3: iOS App Store Setup

### 3.1 Create Apple Developer Account

1. Go to https://developer.apple.com/programs
2. Enroll in Apple Developer Program ($99/year)
3. Create App Store Connect account

### 3.2 Create App ID in App Store Connect

1. Open https://appstoreconnect.apple.com
2. **My Apps** → **Create New App**
3. Fill in:
   - **Platform:** iOS
   - **Name:** QMed Pro
   - **Bundle ID:** com.qmedpro.app
   - **SKU:** com.qmedpro.app (any unique ID)
   - **Category:** Education or Medical
   - **User Type:** Registered User

### 3.3 Configure Xcode Signing

```bash
npm run cap:ios
```

In Xcode:

1. **Select Target:** Project "App" → Targets "App"
2. **General Tab:**
   - **Display Name:** QMed Pro
   - **Bundle Identifier:** com.qmedpro.app
3. **Signing & Capabilities Tab:**
   - Select your **Team** (connects to your Apple Developer account)
   - Xcode auto-provisions signing certificate
4. **Set iOS Minimum Deployment Target:**
   - Under "App" target → Build Settings → search "iOS Deployment Target"
   - Set to **14.0** or higher

### 3.4 Build Archive for Release

In Xcode:

1. Select **Generic iOS Device** (top left scheme selector)
2. **Product** → **Clean Build Folder**
3. **Product** → **Archive**
4. Once complete, **Window** → **Organizer**
5. Select your archive → **Distribute App**
6. Choose **App Store Connect** → **Upload**

### 3.5 Submit to App Store

In App Store Connect:

1. Go to your app → **TestFlight** (test version first if needed)
2. Once tested, go to **App Information:**

   Fill in:

   - **Subtitle:** "Medical Exam Platform with AI"
   - **Description:** "Prepare for medical exams with 60,000+ QCMs, AI-powered recommendations, and spaced repetition learning."
   - **Keywords:** medicine, exam, qcm, mcat, study
   - **Support URL:** https://qmedpro.com/support
   - **Marketing URL:** https://qmedpro.com

3. **Pricing and Availability:**
   - Set to **Free**
   - Select countries

4. **Version Information:**
   - Add **screenshots** (at least 2 per device size: 6.7", 5.5")
   - Add **preview video** (30 seconds max)
   - **Release notes:** "Initial release of QMed Pro"

5. **Age Rating:**
   - Complete questionnaire (typically 4+)

6. **Privacy Policy:**
   - Add link to your privacy policy
   - Mark data collection as "Medical/Health" if applicable

7. **Submit for Review**
   - Click "Submit for Review"
   - Apple reviews in 24-48 hours typically

---

## 🤖 Step 4: Google Play Store Setup

### 4.1 Create Google Play Developer Account

1. Go to https://play.google.com/console
2. Create account ($25 one-time fee)
3. Accept agreements and complete registration

### 4.2 Create App Project

1. **All apps** → **Create app**
2. Enter:
   - **App name:** QMed Pro
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free

### 4.3 Generate Signing Key

Generate a keystore file for signing your APK/AAB:

```bash
keytool -genkey -v -keystore qmedpro-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias qmedpro \
  -storepass qmedpro123 \
  -keypass qmedpro123 \
  -dname "CN=QMed Pro, OU=Development, O=QMed, L=City, ST=State, C=US"
```

**Store this file securely!** You'll need it for every release.

### 4.4 Open Android Project & Sign Release Build

```bash
npm run cap:android
```

In Android Studio:

1. **Build** → **Generate Signed Bundle/APK**
2. Select **Android App Bundle** (Google Play preferred over APK)
3. **Next**
4. **Create new** keystore:
   - Browse to `qmedpro-key.jks` (created above)
   - **Key store password:** qmedpro123
   - **Key password:** qmedpro123
   - **Key alias:** qmedpro
5. Select **Release** build type
6. Build completes → `.aab` file ready

### 4.5 Upload to Google Play

1. In Play Console:
   - **Production** (or **Internal Testing** first)
   - **Create new release**
2. Upload your `.aab` file
3. Review details, then **Save and review**

### 4.6 Complete Store Listing

1. **Store presence** → **Store listing:**

   - **Short description:** "Ace your medical exams"
   - **Full description:** "Master medical exams with 60,000+ QCMs, AI recommendations, and spaced repetition. Track your progress with advanced analytics and compete on leaderboards."
   - **Screenshots:** Upload 2-8 screenshots (min 320x180, max 3840x2160)
   - **Feature graphic:** 1024×500 PNG
   - **Category:** Medical or Education
   - **Content rating:** Complete rating questionnaire

2. **Pricing & distribution:**
   - **Pricing:** Free
   - **Countries:** Select your target markets
   - **Ads:** Disclose if using ads
   - **Content rating:** Likely 4+

3. **Consent:** Accept all policies

### 4.7 Submit for Review

1. **Release management** → **Production**
2. **Review and roll out** → **Start rollout to Production**
3. Google reviews in 1-3 hours typically

---

## 📊 Step 5: Pre-Launch Checklist

### Mobile-Specific Features to Test

- [ ] JWT authentication works over HTTPS
- [ ] Push notifications (if implemented)
- [ ] Offline support (service workers)
- [ ] Screen rotation handling (portrait/landscape)
- [ ] Touch gestures vs mouse clicks
- [ ] Mobile keyboard avoids overlapping UI
- [ ] Splash screen displays on startup
- [ ] Deep linking works (if needed)
- [ ] Storage permissions for any file access
- [ ] Camera/biometric features (if applicable)

### Performance & Security

- [ ] App launches in < 3 seconds
- [ ] No console errors on startup
- [ ] HTTPS only for API calls
- [ ] JWT tokens stored securely (not localStorage if sensitive)
- [ ] No hardcoded credentials in code
- [ ] Privacy policy published and linked
- [ ] Data collection complies with GDPR/CCPA

### Testing on Real Devices

**iPhone:**
```bash
npm run cap:ios
# In Xcode: Product → Run on physical device
```

**Android:**
```bash
npm run cap:android
# In Android Studio: Run app on connected device
```

---

## 🔄 Step 6: Ongoing Updates & Maintenance

### Releasing New Versions

After making code changes:

```bash
# Build updated web app
npm run build

# Sync to native projects
npx cap sync

# iOS Update
npm run cap:ios
# In Xcode: Product → Archive → Distribute → App Store Connect

# Android Update
npm run cap:android
# In Android Studio: Build → Generate Signed Bundle/APK
```

### Version Numbering

Edit in each platform:

**iOS** (`ios/App/App/Info.plist`):
```xml
<key>CFBundleShortVersionString</key>
<string>1.0.1</string>
<key>CFBundleVersion</key>
<string>2</string>
```

**Android** (`android/app/build.gradle`):
```gradle
android {
    defaultConfig {
        versionCode = 2
        versionName = "1.0.1"
    }
}
```

### Release Notes Templates

**App Store & Play Store:**
- Version 1.0.1 — Bug fixes and performance improvements
- Version 1.1.0 — New feature: AI recommendations
- Version 1.2.0 — Offline mode support

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **"No development team selected"** | Go to Xcode → Targets → Signing & Capabilities → Select Team |
| **"Build failed: Undefined symbols"** | Run `npm install` and `npx cap sync` again |
| **"App rejected: Privacy Policy"** | Ensure privacy policy URL is publicly accessible |
| **"Certificate revoked"** | Regenerate certificate in Apple Developer account |
| **"Play Store rejected: Dangerous permissions"** | Check `AndroidManifest.xml` for unnecessary permissions |

---

## 📱 Publishing Timeline

| Stage | Time |
|-------|------|
| Development setup | 1-2 hours |
| Web app build optimization | 1-2 hours |
| iOS certificate generation & build | 2-3 hours |
| Android signing & build | 1-2 hours |
| App Store submission | 24-48 hours review |
| Play Store submission | 1-3 hours review |
| **Total** | **3-7 days** |

---

## 🎯 Next Steps After Launch

1. **Monitor Reviews:** Check both stores daily for feedback
2. **Analytics:** Set up Firebase Analytics to track user behavior
3. **Push Notifications:** Implement for engagement (optional)
4. **Updates:** Plan feature releases every 2-4 weeks
5. **Marketing:** Share app links on your website and social media
6. **Support:** Create in-app help or support link

---

## 📚 Resources

- [Capacitor iOS Documentation](https://capacitorjs.com/docs/ios)
- [Capacitor Android Documentation](https://capacitorjs.com/docs/android)
- [Apple App Store Connect Guide](https://help.apple.com/app-store-connect)
- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Google Play Policies](https://play.google.com/about/developer-content-policy/)

---

*Last updated: April 22, 2026 — QMed Pro Mobile Publication Guide*
