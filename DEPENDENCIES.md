# Dependencies Overview

This document outlines all the dependencies installed for the Weight Loss App and their purposes.

## Production Dependencies

### Core Framework
- **flutter**: The Flutter SDK
- **google_fonts**: ^6.2.1 - For Poppins and Inter fonts used in the app theme

### State Management
- **flutter_riverpod**: ^2.5.1 - State management solution for the app
- **riverpod_annotation**: ^2.3.5 - Annotations for code generation with Riverpod

### Navigation
- **go_router**: ^14.2.7 - Declarative routing solution for Flutter

### Local Storage
- **shared_preferences**: ^2.3.2 - For storing user preferences and app data locally

### Data Serialization
- **json_annotation**: ^4.9.0 - Annotations for JSON serialization
- **freezed_annotation**: ^2.4.4 - Annotations for immutable data classes

### UI Components
- **flutter_svg**: ^2.0.10+1 - For rendering SVG icons and illustrations
- **cached_network_image**: ^3.4.1 - For efficient image loading and caching

### Notifications
- **flutter_local_notifications**: ^17.2.3 - For workout reminders and local notifications
- **timezone**: ^0.9.4 - Timezone support for scheduled notifications

### Utilities
- **intl**: ^0.19.0 - Internationalization and localization support
- **equatable**: ^2.0.5 - For value equality comparisons

## Development Dependencies

### Testing
- **flutter_test**: Flutter testing framework
- **flutter_lints**: ^5.0.0 - Linting rules for Flutter

### Code Generation
- **build_runner**: ^2.4.12 - Build system for Dart code generation
- **json_serializable**: ^6.8.0 - Code generation for JSON serialization
- **freezed**: ^2.5.7 - Code generation for immutable data classes
- **riverpod_generator**: ^2.4.3 - Code generation for Riverpod providers

## Feature Support Matrix

| Feature | Dependencies Used |
|---------|-------------------|
| **Theme System** | google_fonts |
| **State Management** | flutter_riverpod, riverpod_annotation, riverpod_generator |
| **Navigation** | go_router |
| **User Data Storage** | shared_preferences |
| **JSON Data Handling** | json_annotation, json_serializable |
| **Immutable Models** | freezed, freezed_annotation |
| **Workout Images** | flutter_svg, cached_network_image |
| **Workout Reminders** | flutter_local_notifications, timezone |
| **Form Validation** | Built-in Flutter + custom extensions |
| **Internationalization** | intl |
| **Code Generation** | build_runner |

## Asset Configuration

The app is configured to load assets from:
- `lib/data/mock/` - JSON mock data files
- `assets/images/` - Workout illustrations and user interface images
- `assets/icons/` - Custom SVG icons

## Services Initialized

1. **LocalStorageService** - Manages SharedPreferences for user data
2. **NotificationService** - Handles workout reminders and notifications
3. **JsonLoaderService** - Loads and parses JSON data from assets
4. **AppRouter** - Manages navigation between screens

## Code Generation Commands

To generate code for models and providers:

```bash
# Generate all code
flutter packages pub run build_runner build

# Watch for changes and auto-generate
flutter packages pub run build_runner watch

# Clean generated files
flutter packages pub run build_runner clean
```

## Architecture Benefits

This dependency setup provides:

- ✅ **Scalable State Management** - Riverpod for complex app state
- ✅ **Type-Safe Navigation** - GoRouter with type-safe routes
- ✅ **Efficient Data Persistence** - SharedPreferences for user data
- ✅ **Immutable Data Models** - Freezed for data integrity
- ✅ **Automated Code Generation** - Reduces boilerplate code
- ✅ **Rich UI Components** - SVG support and cached images
- ✅ **User Engagement** - Local notifications for workout reminders
- ✅ **Future-Ready** - Easy to extend with API integration

All dependencies are production-ready and actively maintained, ensuring long-term stability for the Weight Loss App.
