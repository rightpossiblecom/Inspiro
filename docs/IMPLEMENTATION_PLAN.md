# Inspiro Implementation Plan

This plan outlines the steps to build the **Inspiro** app, a simple, single-purpose application for daily motivational quotes. The goal is to create a clean, policy-compliant MVP that provides immediate value to the user.

## User Review Required

> [!IMPORTANT]
> **Data Source Decision**: For the MVP, we will use a **local list of curated quotes** within the app. This ensures:
> 1.  No internet dependency for core functionality.
> 2.  Users get instant quotes (fastest response).
> 3.  Zero server costs or API key management.
>
> We can switch to an API in the future if needed.

## Proposed Changes

We will implement the app using Flutter, focusing on a minimal, clean, and vibrant UI.

### 1. Project Setup & Dependencies
-   **Dependencies**:
    -   `google_fonts`: For premium typography (e.g., Inter, Roboto, or Outfit).
    -   `share_plus`: To allow sharing quotes to other apps.
    -   `url_launcher`: To open the Privacy Policy and Contact links.
    -   `flutter_native_splash`: For a clean launch experience (configured later).

### 2. Core Architecture (`lib/`)

#### Data Layer
-   **Model**: `Quote` class (text, author).
-   **Service**: `QuoteService` to generic static/random quotes from a local repository.

#### UI Layer
-   **Theme**:
    -   Define a global `AppTheme` with a vibrant but clean color palette.
    -   Focus on typography and whitespace.
-   **Screens**:
    1.  **HomeScreen**:
        -   **Header**: App Title ("Inspiro").
        -   **Main Content**: Large, readable quote card with animation.
        -   **Actions**:
            -   "Inspire Me" (Primary FAB or large button) -> Fetches new quote.
            -   Share Icon -> Triggers native share sheet.
            -   Settings Icon -> Navigates to Settings.
    2.  **SettingsScreen** (Minimal):
        -   "About" section with app description.
        -   "Privacy Policy" link (opens web URL).
        -   "Contact" info.
        -   Version number.

### 3. Implementation Steps

#### [MODIFY] `pubspec.yaml`
-   Add `google_fonts`, `share_plus`, `url_launcher`.

#### [NEW] `lib/models/quote.dart`
-   Simple data class for `Quote`.

#### [NEW] `lib/data/quotes_data.dart`
-   A curated list of 50-100 safe, motivational quotes.

#### [NEW] `lib/services/quote_service.dart`
-   Logic to get a random quote.
-   (Future) Logic for "daily" quote.

#### [NEW] `lib/theme/app_theme.dart`
-   Define colors and text styles.

#### [NEW] `lib/screens/home_screen.dart`
-   Main UI implementation with animations.

#### [NEW] `lib/screens/settings_screen.dart`
-   Simple list view for app info and legal links.

#### [MODIFY] `lib/main.dart`
-   Entry point, loads theme, sets home to `HomeScreen`.

## Verification Plan

### Automated Tests
-   Verify `QuoteService` returns a valid quote.

### Manual Verification
1.  **Install & Launch**: Verify app opens without errors.
2.  **Quote Flow**:
    -   Tap "Inspire Me" -> Confirm quote changes.
    -   Tap multiple times -> Ensure randomness.
3.  **Share Flow**:
    -   Tap Share button -> Verify system share sheet appears with the correct quote text.
4.  **Settings & Links**:
    -   Open Settings.
    -   Tap "Privacy Policy" -> Verify browser opens.
    -   Check version number is displayed.
