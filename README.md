# 🎵 TikTokClone (iOS)

A TikTok-inspired iOS application built with **SwiftUI**, focusing on modern app architecture, clean UI, and scalable state management.  

---

## ✨ Features

### 🔐 Authentication (Mocked)
- Login screen
- Sign Up screen
- Sign Out with confirmation
- App-wide auth state handling

### 📱 Feed
- Fullscreen vertical video feed
- TikTok-style paging
- Auto-play / pause based on active item
- Tap to play / pause

### 👤 Profile
- User profile header
- Followers / Following / Likes stats
- Post grid
- 
### 🧠 State Management
- `ObservableObject`
- `@EnvironmentObject`
- Single source of truth for auth
- No navigation hacks

---

## 🛠 Tech Stack

- **SwiftUI**
- **Combine**
- **AVKit**
- **UIKit** (NavigationBar appearance customization)
- **iOS 17+ / iOS 26-ready**

---


### Key Principles
- Root view controls authentication flow
- UI reacts to state changes
- Backend logic isolated
- Easy to extend & refactor

---

## 🚀 Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/TikTokClone.git
   ```

2. Open the project
   ```bash
   open TikTokClone.xcodeproj
   ```

3. Run on simulator or device


---

## 🗺 Roadmap

Planned improvements:
- Persist login state (`@AppStorage`)
- Backend authentication
- Upload flow
- Likes & comments
- Profile data from backend
- Video caching & performance optimization

---

## 📌 Notes

This project is built with:
- Real-world SwiftUI patterns
- Scalable architecture
- Clean code practices

It is intended for **portfolio and educational use**.

---

## 👨‍💻 Author

**Giorgi Gotsadze**

iOS Developer  
Swift • SwiftUI • Clean Architecture

---

## 📄 License

This project is for educational and portfolio purposes.
