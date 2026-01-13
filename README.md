# 💊 Medicine Reminder App

A clean, efficient, and reliable Flutter application designed to help users manage their daily medication schedules. Built with a strict **Teal & Orange** design system, this app ensures users never miss a dose by utilizing local notifications and persistent local storage.

## ✨ Features

* **📱 Home Screen Dashboard:** View a sorted list of daily medicines (earliest first).
* **➕ Add Medicine:** Simple form to add medication details (Name, Dosage) and schedule a time.
* **⏰ Reliable Alarms:** Triggers notifications even when the app is closed or the device is in Doze mode (Android 13+ support).
* **💾 Local Storage:** Data persists across restarts using **Hive** (No internet required).
* **🎨 Custom Design:** Aesthetic interface using a Teal (Primary) and Orange (Accent) color palette.
* **📅 Smart Scheduling:** Automatically reschedules daily alarms after device reboots.

---

## 📸 Screenshots

| Home Screen | Add Medicine | Notification |
|:---:|:---:|:---:|
| ![Home](assets/screenshots/home.png) | ![Add](assets/screenshots/add.png) | ![Notify](assets/screenshots/notify.png) |
*(Note: Add your screenshots to an `assets/screenshots` folder)*

---

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Provider
* **Local Database:** Hive (NoSQL)
* **Notifications:** Flutter Local Notifications
* **Time Management:** Timezone & Intl

---

## 🚀 Installation & Setup

Follow these steps to run the project locally.

### 1. Prerequisites
* Flutter SDK (3.x or higher)
* Android Studio / VS Code
* Android Device/Emulator (SDK 34 recommended for testing alarms)

### 2. Clone the Repository
```bash
git clone [https://github.com/yourusername/medicine_reminder.git](https://github.com/yourusername/medicine_reminder.git)
cd medicine_reminder