#!/bin/bash

# QMed Pro — Capacitor Mobile Setup Script
# This script sets up your project for iOS and Android app store deployment

set -e  # Exit on error

echo "🚀 QMed Pro Mobile Setup — Starting..."
echo ""

# Step 1: Install Capacitor
echo "📦 Step 1: Installing Capacitor dependencies..."
npm install @capacitor/core @capacitor/cli
npm install -D @capacitor/ios @capacitor/android
npm install @capacitor/app @capacitor/keyboard @capacitor/status-bar @capacitor/splash-screen @capacitor/http

echo "✅ Capacitor dependencies installed"
echo ""

# Step 2: Add platforms
echo "🔧 Step 2: Adding iOS and Android platforms..."
npx cap add ios
npx cap add android

echo "✅ iOS and Android platforms added"
echo ""

# Step 3: Build web app
echo "🏗️  Step 3: Building web app for production..."
npm run build

echo "✅ Web app built to 'out/' directory"
echo ""

# Step 4: Sync to native projects
echo "🔄 Step 4: Syncing web files to native projects..."
npx cap sync

echo "✅ Web files synced to ios/ and android/ directories"
echo ""

echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo ""
echo "📱 iOS:"
echo "   1. npm run cap:ios"
echo "   2. In Xcode: Select Team in Signing & Capabilities"
echo "   3. Product → Archive → Distribute to App Store"
echo ""
echo "🤖 Android:"
echo "   1. npm run cap:android"
echo "   2. In Android Studio: Build → Generate Signed Bundle/APK"
echo "   3. Upload .aab file to Play Console"
echo ""
echo "📖 Full guide: See APP_STORE_DEPLOYMENT.md"
