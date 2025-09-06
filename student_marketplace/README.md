# Student Marketplace (Web-first)

A Flutter web marketplace for students and partners to list study-related products and services. Listing a product requires a simple 1 JD fee (placeholder flow provided).

## Features

- Filters: School/University, Grade/Level, Subject, Type
- Listings grid and detail page
- Create listing form with 1 JD fee placeholder confirmation
- Clean, student-friendly theme (Material 3)

## Getting Started

1. Install Flutter SDK (already configured in this workspace) and enable web:
   - `flutter --version`
   - `flutter config --enable-web`

2. Run in development (web):
   - `flutter run -d chrome`

3. Build for web:
   - `flutter build web`
   - Output at `build/web/`

## Project Structure

- `lib/main.dart`: App entry, theme
- `lib/models/listing.dart`: Listing model and seeded sample data
- `lib/pages/home_page.dart`: Filters and listings grid
- `lib/pages/listing_detail_page.dart`: Listing details
- `lib/pages/create_listing_page.dart`: Create listing form and fee placeholder

## Roadmap

- Real payments integration for 1 JD fee
- Auth (students, partners), profiles, moderation
- Image upload & storage
- Backend (Firestore/Supabase/etc.) with search
- Responsive polish and accessibility


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
