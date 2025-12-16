# Union Shop – Flutter Coursework

This project is a Flutter application developed as part of a university coursework assignment.  
The aim of the coursework is to reimplement the core functionality of an e-commerce website using Flutter, focusing on clean UI structure, data models, navigation, and interactive features.

The application is inspired by the University of Portsmouth Students’ Union shop and demonstrates both static and dynamic Flutter concepts.

## Features Implemented

### Core Features (Base / Pass Level)
- Static homepage with header, hero section, featured products, and footer
- Responsive header layout (desktop vs mobile navigation)
- Static informational pages (About, Authentication placeholders)
- Consistent navigation using named routes
- Asset-based images and branding

### Intermediate Features
- **Collections page**
  - Populated using data models
  - Alphabetical sorting
  - Filtering (sale-only toggle)
  - Pagination controls
- **Product listings**
  - Model-driven product data
  - Sorting, filtering, and pagination
- **Product detail page**
  - Dynamic pricing based on size and quantity
  - Product images loaded from assets
  - Add-to-cart functionality
- **Shopping cart**
  - Add, remove, and update items
  - Shared state using `ChangeNotifier`
  - Live total price updates
- **Sale collection**
  - Sale items rendered from product models
  - Original vs sale price display

### Testing
- Widget tests written using `flutter_test`
- Tests cover:
  - Homepage layout and responsiveness
  - Header behaviour on desktop and mobile
  - Collections and product listing pages
  - Shopping cart functionality

## Project Structure
```
lib/
├── models/        # Data models (Product, Collection, CartItem)
├── pages/         # App screens (Home, Collections, Product, Cart, etc.)
├── services/      # Shared state (CartService)
├── widgets/       # Reusable UI components
└── main.dart      # App entry point and routing

test/
├── home_page_test.dart
├── collections_page_test.dart
├── collection_page_test.dart
├── product_page_test.dart
└── cart_page_test.dart
```

## Setup Instructions

### Prerequisites
- Flutter SDK installed
- Dart SDK (included with Flutter)

### Running the App
From the project root:

```bash
flutter pub get
flutter run
````

### Running Tests

```bash
flutter test
```

## Assets

Images are stored locally under the `images/` directory and registered in `pubspec.yaml`.

```yaml
flutter:
  assets:
    - images/
```

## Design Decisions

* **Data models** are used instead of hardcoded maps to support scalability.
* **Named routes** are used for navigation to keep routing explicit and readable.
* **Provider** is used for cart state management to allow shared state across pages.

## Limitations and Future Improvements

* No backend or persistent storage (cart resets on app restart)
* Authentication is a placeholder and not functional
* Checkout flow is not implemented
* Product data is currently local and not fetched from an API

Possible future improvements include:

* Backend integration
* Cart persistence
* Checkout and payment flow
* User accounts and authentication
* Product search functionality