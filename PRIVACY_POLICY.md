# Privacy Policy — QMed Pro

**Effective Date:** April 22, 2026  
**Last Updated:** April 22, 2026

---

## 1. Introduction

QMed Pro ("Application," "we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and otherwise process personal information in connection with our mobile and web application.

By accessing or using QMed Pro, you accept the practices described in this Privacy Policy.

---

## 2. Information We Collect

### 2.1 Information You Provide

- **Authentication Data:** Email address, password (hashed with bcrypt)
- **Profile Information:** Name, educational level, specialization
- **Exam History:** Questions answered, scores, timestamps, time spent per question
- **Study Progress:** Bookmarked questions, notes, spaced repetition data
- **Optional Data:** Phone number, profile picture (if you choose to provide)

### 2.2 Automatically Collected Information

- **Device Information:** Device type, OS version, app version, unique device identifier
- **Usage Data:** Pages/features accessed, exam timestamps, time spent on app
- **Analytics:** Crash logs, performance metrics, feature engagement
- **Location Data:** Only if you explicitly enable location services (we do not request this by default)

### 2.3 Data from Third Parties

- **Authentication Providers:** If you sign in via Google/GitHub, we receive your email and basic profile info
- **App Store Data:** Analytics from Apple App Store and Google Play Store

---

## 3. How We Use Your Information

QMed Pro uses collected data for:

- ✅ **Core Service:** Generating exams, tracking progress, providing recommendations
- ✅ **Authentication:** Secure login and account management
- ✅ **Analytics:** Understanding user behavior to improve the app
- ✅ **Communication:** Sending important updates, password resets, account notifications
- ✅ **Personalization:** AI-powered study recommendations based on performance
- ✅ **Legal Compliance:** Combating fraud, enforcing terms of service
- ✅ **Security:** Detecting and preventing unauthorized access

### 3.1 Machine Learning & Recommendations

Your exam answers and study patterns are used to:
- Generate personalized question recommendations
- Calculate optimal spaced repetition intervals (SM-2 algorithm)
- Identify knowledge gaps
- Suggest weak topic areas

This data is **pseudonymized** — we do not share raw answers with other users.

---

## 4. Data Sharing & Disclosure

### 4.1 We DO NOT Sell Your Data

Your personal information is **never sold** to third parties.

### 4.2 We May Share Data With

- **Service Providers:** Cloud hosting (Neon PostgreSQL), analytics services
- **Legal Requirements:** Law enforcement, court orders, government agencies
- **Business Transfers:** If QMed Pro is acquired, data may transfer to the acquirer
- **Consent:** If you explicitly authorize sharing (e.g., leaderboards)

### 4.3 Leaderboard Data

If you enable leaderboard participation:
- Your name or username is publicly visible
- Your scores and rank are displayed
- You can opt-out anytime (hides your entry from public view)

---

## 5. Data Storage & Security

### 5.1 Where We Store Data

- **Primary Database:** PostgreSQL (Neon, hosted in US-East-1)
- **Backups:** Neon automated snapshots and point-in-time restores
- **Application Servers:** Vercel (edge deployment)

### 5.2 Security Measures

- 🔐 **HTTPS/TLS** for all data in transit
- 🔐 **Bcrypt** password hashing (12 rounds)
- 🔐 **JWT tokens** with secure, httpOnly cookies
- 🔐 **SQL injection protection** via Prisma ORM
- 🔐 **CORS & CSRF** protections enabled
- 🔐 **Regular security audits** and penetration testing

---

## 6. Data Retention

- **Account Data:** Retained while account is active
- **Exam History:** Retained for analysis and personalization
- **Study Progress:** Retained indefinitely (unless deleted)
- **Deleted Accounts:** All personal data deleted within 30 days

---

## 7. Your Rights & Choices

### 7.1 Access & Portability

You can request a copy of your data in machine-readable format (including exam history, progress, profile).

### 7.2 Correction & Deletion

- **Edit Profile:** Update your information anytime in app settings
- **Delete Account:** Permanently delete your account and associated data

### 7.3 Opt-Out Options

- **Marketing Emails:** Click "unsubscribe" in email footer
- **Push Notifications:** Disable in app settings or device settings
- **Analytics Tracking:** Enable "Do Not Track" in device settings (we honor DNT)
- **Leaderboard:** Opt-out anytime to hide your scores

---

## 8. Third-Party Services

### 8.1 Services We Use

| Service | Purpose | Privacy Policy |
|---------|---------|-----------------|
| **Neon PostgreSQL** | Database hosting | https://neon.tech/privacy |
| **Vercel** | App hosting | https://vercel.com/legal/privacy-policy |
| **Google Analytics** | Usage analytics | https://policies.google.com/privacy |
| **Firebase** | Crash reporting (optional) | https://firebase.google.com/terms/analytics |
| **Stripe/Paddle** | Payment processing (if paid) | https://stripe.com/privacy |
| **OpenAI** | AI recommendations (optional) | https://openai.com/privacy-policy |

These providers have their own privacy policies. We are not responsible for their practices.

### 8.2 Children's Privacy

QMed Pro is intended for users 16+ years old. We do not knowingly collect data from children under 13 (COPPA compliance).

---

## 9. International Users

### 9.1 GDPR (EU Users)

If you're in the EU, under GDPR you have the right to:
- Access personal data
- Correct inaccuracies
- Delete data ("right to be forgotten")
- Restrict processing
- Data portability
- Withdraw consent anytime

**To exercise these rights:** Contact privacy@qmedpro.com

### 9.2 CCPA (California Users)

If you're in California, under CCPA you have the right to:
- Know what personal data is collected
- Delete your personal data
- Opt-out of data "sales" (we don't sell data)
- Non-discrimination for exercising CCPA rights

**To submit a request:** privacy@qmedpro.com

---

## 10. Changes to This Privacy Policy

We may update this policy from time to time. We will notify you via:
- **In-app notification** for material changes
- **Email** to your registered email address
- **Updated policy date** on this page

Continued use of QMed Pro constitutes acceptance of updated policies.

---

## 11. Contact Us

For privacy questions, requests, or concerns:

📧 **Email:** privacy@qmedpro.com  
🌐 **Website:** https://qmedpro.com/privacy  
📋 **Mailing Address:**  
QMed Pro Privacy Team  
[Your Company Address]

---

## 12. Compliance Certifications

- ✅ GDPR Compliant
- ✅ CCPA Compliant
- ✅ COPPA Compliant (for age-gating)
- ✅ HIPAA Business Associate Agreement available upon request

---

*This Privacy Policy is effective April 22, 2026 and was last updated on April 22, 2026.*
