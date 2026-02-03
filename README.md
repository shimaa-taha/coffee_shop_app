# Coffee Shop Mobile App

A beautiful coffee shop mobile application built with Flutter and BLoC state management, inspired by modern coffee shop designs.

## Features

✨ **Clean Architecture with BLoC Pattern**
- Separation of concerns with BLoC for state management
- Event-driven architecture
- Reactive UI updates

☕ **Core Features**
- Browse coffee menu with categories
- Filter by coffee type (Cappuccino, Espresso, etc.)
- View detailed product information
- Select coffee size (S, M, L)
- Add items to cart
- **Favorites management** - Save your favorite coffees
- **Notifications** - Get updates on orders and promotions
- **User Profile** - Manage your account and settings
- Beautiful dark theme UI

🎨 **UI/UX**
- Modern dark theme design
- Smooth animations
- Responsive layouts
- Category filtering
- Product cards with ratings
- Promotional banner
- Badge notifications for unread notifications
- Swipe to delete notifications

## Screens

📱 **Main Screens**
1. **Home Screen** - Browse coffees, filter by category
2. **Product Detail** - View details, select size, add to favorites
3. **Favorites** - View all saved favorite coffees
4. **Notifications** - See order updates and promotions
5. **Profile** - User information and account settings

## Project Structure

```
lib/
├── main.dart                       # App entry point with all BLoC providers
├── models/
│   ├── coffee.dart                # Coffee data model
│   ├── cart_item.dart             # Cart item model
│   └── notification.dart          # Notification model
├── blocs/
│   ├── coffee_bloc.dart           # Coffee BLoC (product catalog)
│   ├── coffee_event.dart          # Coffee events
│   ├── coffee_state.dart          # Coffee states
│   ├── cart_bloc.dart             # Cart BLoC (shopping cart)
│   ├── cart_event.dart            # Cart events
│   ├── cart_state.dart            # Cart states
│   ├── favorite_bloc.dart         # Favorites BLoC
│   ├── favorite_event.dart        # Favorite events
│   ├── favorite_state.dart        # Favorite states
│   ├── notification_bloc.dart     # Notifications BLoC
│   ├── notification_event.dart    # Notification events
│   └── notification_state.dart    # Notification states
└── screens/
    ├── home_screen.dart                # Main screen with coffee list
    ├── product_detail_screen.dart      # Product detail view
    ├── favorites_screen.dart           # Saved favorites
    ├── notifications_screen.dart       # Notification center
    └── profile_screen.dart             # User profile
```

## BLoC State Management

### Coffee BLoC
Manages the coffee product catalog and filtering:
- **Events**: `LoadCoffees`, `FilterByCategory`
- **States**: `CoffeeInitial`, `CoffeeLoading`, `CoffeeLoaded`, `CoffeeError`

### Cart BLoC
Manages shopping cart operations:
- **Events**: `AddToCart`, `RemoveFromCart`, `UpdateQuantity`, `ClearCart`
- **States**: `CartState` (with items list)

### Favorite BLoC
Manages favorite coffees:
- **Events**: `LoadFavorites`, `AddToFavorites`, `RemoveFromFavorites`, `ToggleFavorite`
- **States**: `FavoriteInitial`, `FavoriteLoading`, `FavoriteLoaded`, `FavoriteError`

### Notification BLoC
Manages notifications and alerts:
- **Events**: `LoadNotifications`, `MarkAsRead`, `MarkAllAsRead`, `DeleteNotification`
- **States**: `NotificationInitial`, `NotificationLoading`, `NotificationLoaded`, `NotificationError`

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone or extract the project**
   ```bash
   cd coffee_shop_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on specific platforms

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Web:**
```bash
flutter run -d chrome
```

## Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3    # BLoC state management
  bloc: ^8.1.2            # Core BLoC library
  equatable: ^2.0.5       # Value equality for events/states
  intl: ^0.18.1           # Date formatting for notifications
```

## Customization

### Adding New Coffee Products

Edit `lib/blocs/coffee_bloc.dart` in the `_onLoadCoffees` method:

```dart
Coffee(
  id: '5',
  name: 'Your Coffee Name',
  description: 'Your description',
  price: 4.99,
  rating: 4.8,
  imageUrl: 'assets/your_image.jpg',
  category: 'Cappuccino',
  isFeatured: false,
),
```

### Changing Colors

Edit theme in `lib/main.dart`:

```dart
primaryColor: const Color(0xFFC67C4E),  // Main orange color
scaffoldBackgroundColor: const Color(0xFF0D0D0D),  // Dark background
```

## Screenshots

The app includes:
- 🏠 Home screen with coffee grid and categories
- 📱 Product detail screen with size selection and favorites
- ❤️ Favorites screen with saved coffees
- 🔔 Notifications screen with swipe-to-delete
- 👤 Profile screen with user settings
- 🎨 Modern dark theme with orange accents
- ⭐ Rating display
- 🔍 Search functionality
- 🏷️ Promotional banner
- 🔴 Notification badges

## Future Enhancements

- [ ] Cart screen
- [ ] Checkout flow
- [ ] Order history
- [ ] User authentication
- [ ] Favorites list
- [ ] Online payment integration
- [ ] Push notifications
- [ ] Order tracking

## Architecture Benefits

**Why BLoC?**
- ✅ Clear separation of business logic and UI
- ✅ Testable code
- ✅ Predictable state management
- ✅ Easy debugging with BLoC observer
- ✅ Scalable for large applications

## License

This project is open source and available for educational purposes.

## Support

For issues or questions, feel free to reach out!

---

Built with ❤️ using Flutter & BLoC
