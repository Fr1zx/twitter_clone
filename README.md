# Frizter

A beautiful, feature-rich Twitter clone built with **Flutter** featuring a stunning design and smooth animations.

---

## Overview

This app allows users to:

* Create and manage accounts
* Publish posts
* Search for posts
* View and edit user settings: name, avatar, profile description, password, email, and more
* Enjoy a fully implemented **dark theme** for comfortable use in any environment

The app focuses on an elegant and modern UI/UX with carefully crafted animations to make the user experience enjoyable and seamless. And uses clean architecture

---

## Features

* **User Authentication** with Firebase Authentication
* **Realtime data** storage and synchronization via Cloud Firestore
* **Image upload and caching** for avatars and post images
* **Push notifications** powered by Firebase Messaging
* **Smooth animations** throughout the app using `flutter_animate`
* **State management** using the powerful BLoC pattern with `flutter_bloc`
* Navigation handled by `go_router` for clean and declarative routing
* Support for sharing posts externally with `share_plus`
* Persistent user preferences with `shared_preferences`
* Modern fonts via `google_fonts`
* Dark mode support with seamless theme switching

---

## Tech Stack

The app is built using the following Flutter packages and tools:

```yaml
dependencies:
  flutter:
    sdk: flutter
  bloc: ^9.0.0
  flutter_bloc: ^9.1.0
  cached_network_image: ^3.4.1
  cloud_firestore: ^5.6.6
  firebase_auth: ^5.5.2
  firebase_core: ^3.13.0
  firebase_messaging: ^15.2.5
  firebase_storage: ^12.4.5
  cupertino_icons: ^1.0.8
  dartz: ^0.10.1
  freezed: ^2.4.1
  freezed_annotation: ^2.4.1
  get_it: ^8.0.3
  go_router: ^14.8.1
  google_fonts: ^6.2.1
  image_picker: ^1.1.2
  intl: ^0.20.2
  json_annotation: ^4.9.0
  lottie: ^3.3.1
  share_plus: ^11.0.0
  shared_preferences: ^2.5.3
  shimmer: ^3.0.0
  flutter_animate: ^4.5.2
  url_launcher: ^6.3.1

dev_dependencies:
  build_runner: ^2.4.15
  flutter_lints: ^5.0.0
  flutter_test:
    sdk: flutter
  json_serializable: ^6.9.4
```

---

## Getting Started

### Prerequisites

* Flutter SDK installed (version >= 3.0.0)
* Firebase project configured for your app with Authentication, Firestore, Storage, and Messaging enabled

### Installation

1. Clone the repository

```bash
git clone https://github.com/yourusername/flutter-twitter-clone.git
cd flutter-twitter-clone
```

2. Install dependencies

```bash
flutter pub get
```

3. Generate code (for freezed and json\_serializable)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Configure Firebase for your platform (Android/iOS/Web)
   Follow the official Firebase setup guides to add `google-services.json` or `GoogleService-Info.plist`

5. Run the app

```bash
flutter run
```

---
