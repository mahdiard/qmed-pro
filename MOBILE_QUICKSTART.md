# 📱 QMed Pro Mobile — Quick Start Guide

> Get your app to iOS and Android app stores in 7 days

---

## 🚀 Day 1-2: Initial Setup

### Install Capacitor

```bash
cd qmed-pro

# Option 1: Automated (recommended)
bash setup-mobile.sh

# Option 2: Manual
npm install @capacitor/core @capacitor/cli
npm install -D @capacitor/ios @capacitor/android
npm install @capacitor/app @capacitor/keyboard @capacitor/status-bar @capacitor/splash-screen @capacitor/http
npx cap add ios
npx cap add android
npm run build:web
npx cap sync
```

### What You Now Have

```
qmed-pro/
├── ios/              ← Xcode project
├── android/          ← Android Studio project
└── out/              ← Built web app (static files)
```

---

## 🍎 Day 3-4: iOS Setup

### 1. Open Xcode

```bash
npm run cap:ios
```

### 2. Configure Signing

In Xcode:
1. **Project "App"** → **Targets "App"**
2. **General Tab:**
   - Display Name: `QMed Pro`
   - Bundle Identifier: `com.qmedpro.app`
3. **Signing & Capabilities:**
   - Select your **Apple Developer Team**
   - Xcode auto-provisions certificate

### 3. Create App Store Connect Entry

1. Visit https://appstoreconnect.apple.com
2. **My Apps** → **Create New App**
   - Platform: iOS
   - Name: QMed Pro
   - Bundle ID: com.qmedpro.app
3. Fill in app details:
   - Category: Education
   - Privacy Policy URL: https://qmedpro.com/privacy

### 4. Build Archive

In Xcode:
1. Product → Clean Build Folder
2. Select **Generic iOS Device** (not simulator)
3. Product → Archive
4. After build: Window → Organizer
5. Select archive → Distribute App → App Store Connect

---

## 🤖 Day 3-4: Android Setup

### 1. Open Android Studio

```bash
npm run cap:android
```

### 2. Generate Signing Key

```bash
keytool -genkey -v -keystore qmedpro-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias qmedpro
```

Save this file! You'll need it for every release.

### 3. Create Play Console Project

1. Visit https://play.google.com/console
2. Create app → QMed Pro
3. Set to **Free**
4. Accept policies

### 4. Sign & Build Release App

In Android Studio:
1. Build → Generate Signed Bundle/APK
2. Choose **Android App Bundle** (.aab)
3. Select your `qmedpro-key.jks` file
4. Release build
5. Upload .aab to Play Console → Production

---

## 📋 Day 5-6: Store Listings

### Both Stores Need

✅ **Screenshots** (2-8 images)
- Portrait mode preferred
- Highlight key features
- Show real app usage

✅ **Description**
```
Master medical exams with 60,000+ QCMs, AI-powered recommendations, and spaced repetition learning. Track your progress with advanced analytics and compete on leaderboards.
```

✅ **Privacy Policy & Terms**
- See: PRIVACY_POLICY.md & TERMS_OF_SERVICE.md
- Host on your website
- Link in store listing

✅ **Support Contact**
- Email: support@qmedpro.com
- Website: https://qmedpro.com

### iOS (App Store)

1. App Store Connect → Your App
2. **Pricing & Availability** → Free
3. **App Information:**
   - Subtitle: "Medical Exam Platform"
   - Keywords: qcm, medicine, exam, study, medical
4. **Version Info:**
   - Upload screenshots
   - Add release notes
   - Set age rating (typically 4+)
5. **Submit for Review**

Review time: **24-48 hours**

### Android (Play Store)

1. Play Console → Your App
2. Store listing → Complete all fields
3. Pricing: Free
4. Target countries
5. Upload screenshots & feature graphic (1024×500)
6. Submit for review

Review time: **1-3 hours**

---

## 🧪 Day 7: Testing Before Launch

### Test on Real Devices

**iPhone:**
```bash
# In Xcode: Product → Run (select physical device)
```

**Android:**
```bash
# In Android Studio: Run app on connected device
```

### Checklist

- [ ] App launches without crashes
- [ ] Login/authentication works
- [ ] Exams generate correctly
- [ ] Scores save properly
- [ ] Offline features work (if applicable)
- [ ] Screen rotation works
- [ ] Navigation is touch-friendly
- [ ] Text is readable (not cut off)
- [ ] All links in app work
- [ ] Performance is smooth

### Beta Testing (Optional but Recommended)

**TestFlight (iOS):**
1. App Store Connect → TestFlight
2. Add beta testers
3. Let them test for 2-3 days
4. Fix any bugs
5. Move to production

**Google Play Internal Testing:**
1. Play Console → Internal Testing Track
2. Add testers
3. Fix any issues
4. Release to production

---

## 📊 Timeline

| Task | Duration | Deadline |
|------|----------|----------|
| Capacitor setup | 1-2 hours | Day 1 |
| iOS build & signing | 2-3 hours | Day 3 |
| Android build & signing | 1-2 hours | Day 3 |
| App store listings | 3-4 hours | Day 5-6 |
| Screenshots & descriptions | 2-3 hours | Day 5-6 |
| Testing | 1-2 hours | Day 7 |
| **App Store Submission** | 24-48 hours | Day 7+ |
| **Play Store Approval** | 1-3 hours | Day 7+ |
| **TOTAL** | **6-7 days** | |

---

## 🎯 After Launch

### Week 1

- ✅ Monitor reviews daily
- ✅ Fix critical bugs immediately
- ✅ Respond to user feedback
- ✅ Check crash logs (if analytics enabled)

### Ongoing

- Release updates every 2-4 weeks
- Plan feature improvements
- Monitor performance
- Gather user feedback

### Next Features to Consider

1. **Push Notifications** — Keep users engaged
2. **Offline Mode** — Access content without internet
3. **Premium Features** — Monetize if needed
4. **Analytics** — Track user behavior
5. **Social Features** — Leaderboards, study groups

---

## 🐛 Common Issues

| Problem | Solution |
|---------|----------|
| **Xcode: "No development team selected"** | Go to Targets → Signing & Capabilities → Select Team |
| **Android Studio: "Build failed"** | Clean build folder, update gradle, check Java version |
| **App Store rejection: Missing privacy policy** | Create public privacy policy URL |
| **Play Store rejection: Dangerous permissions** | Remove unnecessary Android permissions |
| **Slow app launch** | Check web app build size, optimize images |

---

## 📚 Full Documentation

- **Complete Guide:** See `APP_STORE_DEPLOYMENT.md`
- **Privacy Policy:** See `PRIVACY_POLICY.md`
- **Terms of Service:** See `TERMS_OF_SERVICE.md`
- **Configuration:** See `.env.mobile.example`

---

## 💬 Commands Reference

```bash
# Build & sync
npm run build:web           # Build web app + sync to native
npm run mobile:build        # Same as above

# Open native IDEs
npm run cap:ios             # Open Xcode
npm run cap:android         # Open Android Studio
npm run mobile:ios          # Build → iOS
npm run mobile:android      # Build → Android

# View changes
npx cap sync                # Sync latest web files to native projects
```

---

## ✅ Pre-Launch Checklist

- [ ] Capacitor setup complete
- [ ] App builds without errors on iOS
- [ ] App builds without errors on Android
- [ ] Tested on real devices
- [ ] No console errors on startup
- [ ] Authentication works on mobile
- [ ] Privacy policy URL is live
- [ ] Terms of service URL is live
- [ ] App Store Connect account created
- [ ] Google Play Console account created
- [ ] Screenshots are high quality (5-6 per store)
- [ ] App description is compelling
- [ ] Release notes are ready
- [ ] Support email is functional

---

**Ready to launch?** Submit to app stores and celebrate! 🎉

For detailed help: See `APP_STORE_DEPLOYMENT.md`
