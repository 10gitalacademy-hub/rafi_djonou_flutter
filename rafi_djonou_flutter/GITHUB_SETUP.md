# 📱 RAFI DJONOU - Guide GitHub & Compilation APK

## 🚀 Exporter vers GitHub et Compiler l'APK

### Étape 1 : Créer un Repository GitHub

1. Aller sur https://github.com/new
2. Créer un nouveau repository :
   - **Name** : `rafi-djonou-app`
   - **Description** : "RAFI DJONOU - Premium Jewelry Marketplace"
   - **Visibility** : Public (pour GitHub Actions gratuit) ou Private
   - **Initialize** : Ne rien cocher (on va pusher le code existant)
3. Cliquer **Create repository**

### Étape 2 : Initialiser Git Localement

```bash
# Aller dans le dossier du projet
cd rafi_djonou_flutter

# Initialiser git
git init

# Ajouter le remote GitHub
git remote add origin https://github.com/TON_USERNAME/rafi-djonou-app.git

# Ajouter tous les fichiers
git add .

# Faire le premier commit
git commit -m "Initial commit: RAFI DJONOU Flutter app"

# Pousser vers GitHub
git branch -M main
git push -u origin main
```

### Étape 3 : GitHub Actions va Compiler Automatiquement

Une fois que tu as poussé le code :

1. Aller sur ton repo GitHub
2. Cliquer sur l'onglet **Actions**
3. Tu verras le workflow **Build APK** qui s'exécute
4. Attendre ~15-20 minutes que la compilation se termine

### Étape 4 : Télécharger l'APK

**Option A : Depuis les Artifacts (Recommandé)**

1. Aller dans **Actions** → **Build APK** (le dernier run)
2. Scroller vers le bas → **Artifacts**
3. Télécharger `rafi-djonou-apk` (contient l'APK compilé)

**Option B : Depuis les Releases (pour les versions finales)**

1. Créer un **Tag** pour marquer une version :
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```
2. GitHub Actions crée automatiquement une **Release**
3. L'APK est disponible en téléchargement dans **Releases**

### Étape 5 : Installer l'APK sur Android

```bash
# Avec adb (Android Debug Bridge)
adb install build/app/outputs/flutter-apk/app-release.apk

# Ou transférer le fichier APK sur ton téléphone et l'ouvrir
```

---

## 📋 Fichiers Importants

- `.github/workflows/build_apk.yml` → Configuration GitHub Actions
- `pubspec.yaml` → Dépendances Flutter
- `android/app/build.gradle.kts` → Configuration Android
- `lib/main.dart` → Point d'entrée de l'app

---

## 🔧 Troubleshooting

### L'Action échoue ?

1. Vérifier les **logs** dans l'onglet **Actions**
2. Vérifier que `pubspec.yaml` est correct
3. Vérifier que `android/app/build.gradle.kts` est correct

### L'APK ne se compile pas ?

```bash
# Nettoyer et réessayer localement
flutter clean
flutter pub get
flutter build apk --release
```

### Erreur de dépendances ?

```bash
flutter pub upgrade
flutter pub get
```

---

## 📦 Prochaines Étapes

### Pour Publier sur Google Play Store

1. Créer un compte Google Play Developer ($25)
2. Aller sur https://play.google.com/console
3. Créer une nouvelle application
4. Uploader l'**App Bundle** (`.aab`) depuis GitHub Actions
5. Remplir les détails (description, screenshots, etc.)
6. Soumettre pour révision

### Pour Mettre à Jour l'App

```bash
# Modifier le code
# Augmenter la version dans pubspec.yaml
# Committer et pousser
git add .
git commit -m "Update: nouvelle fonctionnalité"
git push origin main

# GitHub Actions recompile automatiquement
# Télécharger la nouvelle APK
```

---

## 📚 Ressources

- **Flutter Docs** : https://flutter.dev/docs
- **GitHub Actions** : https://docs.github.com/en/actions
- **Google Play Console** : https://developer.android.com/distribute/play-console
- **Android Debug Bridge** : https://developer.android.com/studio/command-line/adb

---

## 💡 Tips

- **Versioning** : Augmente `versionCode` et `versionName` dans `pubspec.yaml` pour chaque release
- **Changelog** : Crée un `CHANGELOG.md` pour documenter les changements
- **Secrets** : Si tu as besoin de clés API, utilise GitHub Secrets (Settings → Secrets)
- **Branches** : Utilise `develop` pour le développement, `main` pour les releases stables

---

## ✅ Checklist Avant Publication

- [ ] Tester l'app localement
- [ ] Vérifier les screenshots et description
- [ ] Augmenter la version
- [ ] Créer un tag Git
- [ ] Vérifier que GitHub Actions compile sans erreur
- [ ] Télécharger et tester l'APK sur un vrai téléphone
- [ ] Uploader sur Google Play Store

---

**Besoin d'aide ?** Consulte les logs GitHub Actions ou contacte le support Flutter.
