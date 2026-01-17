# 🧸 My Happiness

> Your Personal Diary of Joy and Happiness Moments

A Flutter mobile application designed to capture and celebrate the little moments of happiness in your daily life. Build a collection of positive memories and revisit them whenever you need a smile.

## 🌟 Features

✨ **Capture Moments** - Write down the little things that made you smile today
- Add happiness entries with a title and description
- Choose from 60+ emoji categories to represent your mood
- Automatically timestamp each entry

💖 **Daily Happiness** - Build a collection of positive memories
- View all your happiness moments organized by date
- Easily edit or delete past entries
- See your complete happiness journey

🌈 **Reflect & Grow** - Look back and remember the good times
- Browse through your collection of memories
- Organized chronologically (newest first)
- Beautiful card-based UI design

📱 **Mobile-Optimized** - Perfect for on-the-go happiness tracking
- Responsive design that works on all screen sizes
- Fast and smooth user experience
- Lightweight and efficient storage

## 🎨 Emoji Categories

The app includes 6 emoji categories to match your mood:

- 🍕 **Food** - Pizza, Cake, Coffee, Noodles, Ice Cream, Chocolate
- 👥 **Friends** - Friends, Partner, Family, Meeting, Gift, Party
- 📚 **Hobbies** - Reading, Gaming, Music, Art, Photo, Writing
- 🌸 **Nature** - Flowers, Rainbow, Sunshine, Moon, Stars, Butterfly
- 🏆 **Achievement** - Trophy, Study, Strength, Done, Goal, 100%
- 💖 **Feelings** - Love, Sparkle, Star, Happy, Love Face, Peaceful

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for emulator/device testing)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/my-happiness.git
cd my-happiness
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📋 Project Structure

```
lib/
├── main.dart                 # App entry point & theme configuration
├── splash_screen.dart        # Welcome screen
├── home_page.dart           # Main happiness list page
├── info_page.dart           # About & information page
├── models/
│   └── item.dart            # Item data model
└── services/
    └── item_service.dart    # Local storage & data management
```

## 🔧 Technologies Used

- **Framework**: Flutter
- **Language**: Dart
- **Storage**: SharedPreferences (Local storage)
- **Date Formatting**: intl package
- **UI/UX**: Material Design 3

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.2.2
  intl: ^0.19.0
```

## 🎯 How to Use

### Adding a Happiness Entry

1. Tap the **"+"** floating action button on the home page
2. Click **"Choose an icon"** and select an emoji category
3. Pick an emoji that matches your feeling
4. Fill in the title (what made you happy?)
5. Add optional details in the description field
6. Tap **"Save"** to store your memory

### Editing an Entry

1. Long press on any happiness card
2. Select **"Edit"** from the menu
3. Make your changes
4. Tap **"Update"** to save

### Deleting an Entry

1. Long press on any happiness card
2. Select **"Delete"** from the menu
3. Confirm the deletion

### Viewing Your Collection

- All entries are displayed on the **"My Happiness"** page
- Entries are sorted by date (newest first)
- Swipe through different date sections to explore your memories

## 💾 Data Storage

- Happiness entries are stored locally using SharedPreferences
- No internet connection required
- All data is stored on your device
- No personal data is collected or sent anywhere

## 🎨 Color Scheme

- **Primary Color**: `#D4A574` (Warm Brown)
- **Secondary Color**: `#F5E6D3` (Light Beige)
- **Background**: `#FFF8F0` (Off White)
- **Accent**: `#8B6F47` (Dark Brown)

## 🌱 Tips for Best Results

- ✍️ Write something every day, no matter how small
- 🔍 Be specific - details make memories vivid
- 🎉 Don't just write big moments, small joys count too!
- 📖 Read your past entries when you need a smile

## 🛠️ Development

### Building for Release

**Android:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

### Running Tests

```bash
flutter test
```

## 📝 Future Enhancements

- [ ] Export entries to PDF
- [ ] Share memories with friends
- [ ] Monthly/yearly statistics
- [ ] Backup to cloud
- [ ] Dark mode support
- [ ] Search and filter functionality
- [ ] Push notifications for daily reminders

## 🐛 Known Issues

None at the moment. Please report any bugs you find!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 💬 Feedback & Support

Have suggestions or found a bug? Please open an issue on GitHub!

---

**Remember:** Happiness is not by chance, but by choice 🌈

Made with ❤️ for your happiness
