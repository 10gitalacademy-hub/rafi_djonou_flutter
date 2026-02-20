# RAFI DJONOU - Flutter App

Application mobile premium de marketplace de bijoux en perles pour Google Play Store.

## Architecture

- **Framework** : Flutter 3.24.0+
- **Language** : Dart
- **Design** : Premium luxury aesthetic (or #B08D57, blanc, noir)
- **i18n** : Français et Anglais
- **State Management** : Provider
- **Routing** : GoRouter

## Structure du Projet

```
lib/
├── main.dart                 # Point d'entrée
├── app/
│   ├── app_state.dart       # Gestion d'état globale
│   ├── theme.dart           # Thème premium
│   ├── i18n.dart            # Traductions FR/EN
│   └── routes.dart          # Configuration des routes
├── models/
│   └── product.dart         # Modèle produit + données mock
├── screens/
│   ├── onboarding_screen.dart
│   ├── main_navigation_screen.dart
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── sell_screen.dart
│   ├── alerts_screen.dart
│   ├── profile_screen.dart
│   ├── waist_assistant_screen.dart
│   └── customize_screen.dart
└── widgets/
    └── product_card.dart    # Composant réutilisable

```

## Installation & Compilation

### Prérequis

- Flutter SDK 3.24.0+ : https://flutter.dev/docs/get-started/install
- Android SDK 21+ ou iOS 12.0+
- Un compte Google Play Developer ($25 one-time)

### Étapes de Compilation

#### 1. Cloner et installer les dépendances

```bash
cd rafi_djonou_flutter
flutter pub get
```

#### 2. Compiler pour Android

```bash
# Build APK (debug)
flutter build apk --debug

# Build APK (release)
flutter build apk --release

# Build App Bundle (pour Play Store - recommandé)
flutter build appbundle --release
```

Le fichier sera généré dans :
- APK : `build/app/outputs/flutter-apk/app-release.apk`
- App Bundle : `build/app/outputs/bundle/release/app-release.aab`

#### 3. Compiler pour iOS (optionnel)

```bash
flutter build ios --release
```

## Publication sur Google Play Store

### 1. Créer un compte Google Play Developer

- Aller sur https://play.google.com/console
- Payer les $25 de frais d'inscription
- Créer une nouvelle application

### 2. Préparer les Assets

Créer les fichiers suivants :

**Icon** (512x512 PNG) : `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`

**Screenshots** (1080x1920 PNG) : Minimum 2 screenshots

**Description courte** : "Marketplace premium de bijoux en perles faits à la main"

**Description complète** :
```
RAFI DJONOU - Découvrez des créations uniques en perles

✨ Fonctionnalités :
- Catalogue de bijoux artisanaux (colliers, bracelets, boucles d'oreilles, perles de hanche)
- Recherche avancée avec filtres par catégorie, prix, couleur, taille
- Créateur de personnalisation pour composer des bijoux uniques
- Assistant mesure pour perles de hanche
- Panier et checkout sécurisé
- Gestion des favoris et alertes
- Module vendre pour les artisanes
- Bilingue FR/EN

🎨 Design premium avec thème or et blanc
📱 Interface mobile optimisée
🛍️ Expérience e-commerce complète
```

### 3. Signer l'App Bundle

```bash
# Créer une clé de signature (une seule fois)
keytool -genkey -v -keystore ~/rafi_djonou_key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias rafi_djonou_key

# Configurer la signature dans android/app/build.gradle.kts
# (voir instructions Flutter officielles)
```

### 4. Uploader sur Play Store

1. Aller dans Google Play Console
2. Cliquer sur "Créer une application"
3. Remplir les informations de base
4. Uploader l'App Bundle (`.aab`)
5. Remplir les détails (description, screenshots, catégorie)
6. Configurer le prix (gratuit ou payant)
7. Soumettre pour révision

**Temps de révision** : 2-4 heures généralement

## Fonctionnalités Implémentées

- ✅ Onboarding avec sélecteur de langue
- ✅ Navigation 5 onglets (Accueil, Recherche, Vendre, Alertes, Profil)
- ✅ Accueil avec 6 sections (À la une, Tendances, Collections, Nouveautés, Best sellers, Idées cadeaux)
- ✅ Recherche avec filtres avancés
- ✅ Fiche produit détaillée avec galerie
- ✅ Panier et gestion des quantités
- ✅ Favoris/Watchlist
- ✅ Assistant Mesure perles de hanche
- ✅ Créateur de Personnalisation
- ✅ Profil avec sélecteur de langue
- ✅ Bilingue FR/EN
- ✅ Thème premium or #B08D57

## Prochaines Étapes

1. **Intégration Backend** : Connecter à une API pour les vrais produits, utilisateurs, commandes
2. **Authentification** : Implémenter OAuth/Firebase Auth
3. **Paiement** : Intégrer Stripe ou Google Pay
4. **Upload Photos** : Permettre aux vendeurs d'uploader des photos
5. **Notifications** : Push notifications pour les commandes et messages
6. **Chat** : Système de messagerie vendeur/acheteur

## Support

Pour des questions sur Flutter :
- https://flutter.dev/docs
- https://pub.dev (packages)
- https://stackoverflow.com/questions/tagged/flutter

Pour publier sur Play Store :
- https://developer.android.com/distribute/play-console
- https://support.google.com/googleplay/android-developer

## Licence

MIT
