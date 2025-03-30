# DreamHome

A mobile application built with **Flutter** and backed by a **MySQL database**, designed to modernize and streamline the operations of the DreamHome property rental company.

---

## 📖 Overview

DreamHome specializes in **property management**, acting as an intermediary between property owners and clients seeking furnished rentals. This app is based on the DreamHome case study and addresses key operational pain points through digitized workflows:

- User-driven property listing and discovery  
- Staff management and branch-level operations  
- Lease tracking and feedback systems  
- Clean, UI-focused weekly property showcase

---

## 🚀 Tech Stack

| Layer     | Technology       |
|-----------|------------------|
| Frontend  | Flutter           |
| Backend   | To be decided     |
| Database  | MySQL             |
| Auth      | SharedPreferences (local session) |

---

## 📱 Features

### 🔹 Staff & Branch Management
- Staff login via pre-created credentials
- Role-based association (Manager, Supervisor, Assistant)
- View staff reports grouped by branch

### 🔹 Property Management
- Any logged-in user can register properties
- Owner = User (no role separation needed)
- Property listings tied to branches
- Weekly listings ranked by feedback

### 🔹 Client Services
- Register with property preferences
- View and comment on properties
- View ratings from other clients
- Auto-assigned assistant based on branch

### 🔹 Lease Handling
- Staff-generated leases based on client-property pairing
- Rental extension by generating new leases
- Lease history per user

---

## 📂 Folder Structure

```bash
lib/
├── core/                  # Global constants, theme, utilities
├── data/                  # Models, API services, repositories
├── features/              # Modular feature folders (auth, home, property, lease, staff, etc.)
│   ├── auth/
│   ├── home/
│   ├── property/
│   ├── lease/
│   └── staff/
├── shared/                # Common UI components/widgets
├── routes/                # Route management using go_router
└── main.dart              # Entry point with auth gate logic
```

---

## 👥 Team

- [Phantomcoder9632](https://github.com/Phantomcoder9632)
- [amal554-arch](https://github.com/amal554-arch)
- [Ganesh-Kumatole](https://github.com/Ganesh-Kumatole)
- [ATULESH811](https://github.com/ATULESH811)
- [RohanBabhale1](https://github.com/RohanBabhale1)

---

## 🛠️ Setup & Installation

Instructions will be provided once the backend is finalized. For now:
- Clone the repo
- Run `flutter pub get`
- Launch with `flutter run`

Ensure you have Flutter SDK installed and configured.

---

## 📄 License

This project is built solely for academic purposes in response to the **DreamHome case study** and is not intended for commercial deployment or use.
