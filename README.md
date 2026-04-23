# QMed Pro — Guide d'Installation Complet

> Plateforme SaaS médicale premium avec IA adaptative, 60 000+ QCMs, et analytics avancés.

---

## ⚡ Prérequis

- **Node.js** 18+ — https://nodejs.org
- **PostgreSQL** 14+ — https://www.postgresql.org
- **npm** ou **pnpm**

---

## 🚀 Installation Rapide (5 minutes)

### 1. Cloner / Copier le projet

```bash
cd qmed-pro
```

### 2. Installer les dépendances

```bash
npm install
```

### 3. Configurer la base de données

Créez une base de données PostgreSQL :

```sql
CREATE DATABASE qmed_pro;
```

Copiez le fichier d'environnement :

```bash
cp .env.local .env
```

Éditez `.env` avec vos paramètres :

```env
DATABASE_URL="postgresql://VOTRE_USER:VOTRE_PASSWORD@localhost:5432/qmed_pro?schema=public"
JWT_SECRET="changez-ce-secret-en-production-avec-32-chars-min"
NEXT_PUBLIC_APP_URL="http://localhost:3000"
```

### 4. Initialiser Prisma et la base de données

```bash
# Générer le client Prisma
npm run db:generate

# Créer les tables (migration)
npm run db:push

# Peupler avec les données de démo
npm run db:seed
```

### 5. Lancer l'application

```bash
npm run dev
```

Ouvrez **http://localhost:3000** 🎉

---

## 👤 Comptes de démonstration

| Rôle | Email | Mot de passe |
|------|-------|--------------|
| **Admin** | admin@qmedpro.app | admin123 |
| **Premium** | sarah@qmedpro.app | student123 |
| **Gratuit** | omar@qmedpro.app | student123 |
| **AI Pro** | leila@qmedpro.app | student123 |

---

## 📁 Structure du Projet

```
qmed-pro/
├── prisma/
│   ├── schema.prisma          # Schéma DB complet (10 modèles)
│   └── seed.ts                # Données de démonstration
│
├── src/
│   ├── app/
│   │   ├── page.tsx           # Landing page (marketing)
│   │   ├── layout.tsx         # Root layout
│   │   │
│   │   ├── (auth)/            # Pages auth (login/register)
│   │   │   ├── login/page.tsx
│   │   │   └── register/page.tsx
│   │   │
│   │   ├── (dashboard)/       # Dashboard protégé
│   │   │   ├── layout.tsx     # Layout avec sidebar
│   │   │   ├── student/
│   │   │   │   ├── exams/
│   │   │   │   │   ├── page.tsx           # Générateur d'examen
│   │   │   │   │   └── [id]/
│   │   │   │   │       ├── page.tsx       # Moteur d'examen
│   │   │   │   │       └── result/page.tsx # Correction
│   │   │   │   ├── history/page.tsx       # Historique + charts
│   │   │   │   ├── bookmarks/page.tsx     # Favoris
│   │   │   │   └── leaderboard/page.tsx   # Classement
│   │   │   └── admin/
│   │   │       ├── questions/page.tsx     # CRUD questions
│   │   │       ├── users/page.tsx         # Gestion utilisateurs
│   │   │       └── analytics/page.tsx     # Stats globales
│   │   │
│   │   └── api/               # API Routes (backend)
│   │       ├── auth/{login,register,logout}/
│   │       ├── questions/[id]/
│   │       ├── exams/{generate,submit,[id]}/
│   │       ├── analytics/
│   │       ├── bookmarks/
│   │       ├── notes/
│   │       ├── subjects/
│   │       ├── users/leaderboard/
│   │       └── admin/{stats,users,questions}/
│   │
│   ├── components/
│   │   ├── landing/           # Hero, Features, Pricing, etc.
│   │   ├── layout/            # Sidebar, Topbar, ThemeProvider
│   │   ├── admin/             # QuestionModal, CSVImportModal
│   │   └── ui/                # Toaster
│   │
│   ├── lib/
│   │   ├── prisma.ts          # Client DB singleton
│   │   ├── auth.ts            # JWT utilities
│   │   ├── utils.ts           # Helpers, SM-2, formatters
│   │   └── services/
│   │       ├── exam.service.ts      # Génération + soumission
│   │       └── analytics.service.ts # Stats utilisateur + admin
│   │
│   ├── types/index.ts         # Types TypeScript complets
│   ├── middleware.ts          # Protection des routes
│   └── styles/globals.css     # Design system CSS
│
├── public/
│   └── manifest.json          # PWA manifest
│
├── tailwind.config.ts         # Config Tailwind + tokens
├── tsconfig.json
├── next.config.js
└── package.json
```

---

## 🧠 Architecture Technique

### Backend (API Routes Next.js)

| Route | Méthode | Description |
|-------|---------|-------------|
| `/api/auth/login` | POST | Connexion JWT |
| `/api/auth/register` | POST | Inscription |
| `/api/auth/logout` | POST | Déconnexion |
| `/api/questions` | GET/POST | Liste + création |
| `/api/questions/[id]` | GET/PUT/DELETE | CRUD individuel |
| `/api/exams/generate` | POST | Génération intelligente |
| `/api/exams/submit` | POST | Soumission + correction |
| `/api/exams/[id]` | GET | Détail examen |
| `/api/analytics` | GET | Stats étudiant |
| `/api/bookmarks` | GET/POST | Toggle favoris |
| `/api/notes` | POST | Notes par question |
| `/api/subjects` | GET | Liste matières |
| `/api/users/leaderboard` | GET | Classement semaine |
| `/api/admin/stats` | GET | Stats globales |
| `/api/admin/users` | GET | Liste utilisateurs |

### Fonctionnalités Clés

**Génération d'examen intelligente** (`exam.service.ts`) :
- Évite les questions récemment vues (200 dernières réponses)
- Fallback sur les anciennes questions si nécessaire
- Shuffle aléatoire garanti
- Calcul XP adaptatif selon difficulté

**Algorithme SM-2 (Répétition Espacée)** (`utils.ts`) :
- Implémentation complète de la formule SuperMemo 2
- Interval, ease factor, repetitions par question
- Mise à jour automatique après chaque examen

**Anti-triche** (`exam engine`) :
- Détection du changement d'onglet via `visibilitychange`
- Comptage des avertissements
- Enregistrement dans la BD

---

## 💾 Schéma Base de Données

```
User          ─── Exam ─────── ExamQuestion ─── Question
  │               │                                │
  │               └─── Answer ──────────────────── │
  │                                                │
  ├─── Bookmark ────────────────────────────────── │
  ├─── Note ────────────────────────────────────── │
  ├─── SpacedRepItem ───────────────────────────── │
  ├─── ExamAttempt                                 │
  └─── LeaderboardEntry                    Subject ┘
                                              │
                                           Chapter
```

---

## 🎨 Design System

| Token | Valeur |
|-------|--------|
| Font display | Fraunces (serif élégant) |
| Font body | DM Sans |
| Accent | Emerald #10b981 |
| Background dark | Obsidian #080c14 |
| Glass | backdrop-blur(20px) |
| Border radius | 12px (cards), 20px (sections) |

---

## 🔧 Commandes Utiles

```bash
# Développement
npm run dev

# Build production
npm run build
npm start

# Base de données
npm run db:studio     # Interface visuelle Prisma
npm run db:seed       # Remettre les données de démo
npm run db:reset      # Reset complet + re-seed
npm run db:migrate    # Nouvelle migration

# Linting
npm run lint
```

---

## 🚀 Déploiement Production (Vercel)

1. Poussez sur GitHub
2. Connectez à [vercel.com](https://vercel.com)
3. Ajoutez les variables d'environnement :
   - `DATABASE_URL` → votre Postgres (Neon, Supabase, Railway...)
   - `JWT_SECRET` → chaîne aléatoire 32+ chars
   - `NEXT_PUBLIC_APP_URL` → votre domaine
4. Déployez !

### Base de données cloud recommandée :
- **Neon** (serverless PostgreSQL gratuit) — https://neon.tech
- **Supabase** — https://supabase.com
- **Railway** — https://railway.app

---

## 📈 Ajouter des Questions en Masse

### Via CSV Import (interface admin)

Format du fichier CSV :
```csv
question,option_a,option_b,option_c,option_d,correct_answers,explanation,difficulty,tags
"Quel nerf innerve...","Nerf vague","Nerf phrénique","Nerf intercostal","Nerf accessoire","B","Le nerf phrénique...","MEDIUM","nerfs,anatomie"
```

### Via le seed (prisma/seed.ts)

Ajoutez vos questions dans le tableau `questionsData` et relancez :
```bash
npm run db:seed
```

### Via l'API (programmatique)

```bash
curl -X POST http://localhost:3000/api/questions \
  -H "Content-Type: application/json" \
  -H "Cookie: qmed_token=VOTRE_TOKEN" \
  -d '{
    "question": "...",
    "options": {"A": "...", "B": "...", "C": "...", "D": "..."},
    "correctAnswers": ["B"],
    "explanation": "...",
    "difficulty": "MEDIUM",
    "subjectId": "ID_MATIERE"
  }'
```

---

## 🔒 Sécurité

- ✅ JWT httpOnly cookies (non accessible JS)
- ✅ Middleware de protection des routes
- ✅ Bcrypt pour les mots de passe (salt rounds: 12)
- ✅ Validation Zod sur tous les inputs
- ✅ Protection CSRF via SameSite=Lax
- ✅ Séparation Admin/Student via middleware

---

## 🤖 Activer les Fonctionnalités IA (optionnel)

Ajoutez votre clé OpenAI dans `.env` :
```env
OPENAI_API_KEY=sk-...
```

Les routes `/api/ai/recommend` et `/api/ai/chat` utilisent cette clé pour :
- Recommandations personnalisées basées sur les lacunes
- Chatbot tuteur IA

---

*QMed Pro — Construit pour dominer les concours médicaux.*
