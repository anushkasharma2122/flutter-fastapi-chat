# 💬 Flutter + FastAPI Real-Time Chat App

A beginner-friendly real-time chat application built using **Flutter** (frontend) and **FastAPI** (backend) with **WebSocket** communication.
Great for learning how WebSockets work in full-stack apps!

---

## 🎯 Purpose

This project is designed for **educational purposes** — to help you understand how:

* Flutter connects to a WebSocket server
* FastAPI handles real-time communication using WebSocket
* Data flows between client and server
* You can build chat UIs dynamically in Flutter

---

## 🚀 Features

* 🔁 Real-time messaging using WebSockets
* 👤 Simple username entry before chat
* 📩 Message broadcasting to all connected users
* 🧭 UI distinguishes between sender and receiver
* 🕒 Timestamp displayed with each message
* 📚 Minimal and readable code for easy learning

---

## 🛠️ Tech Stack

| Layer    | Technology       |
| -------- | ---------------- |
| Frontend | Flutter (Dart)   |
| Backend  | FastAPI (Python) |
| Protocol | WebSockets       |

---

## 📦 Folder Structure

```
├── lib/                  # Flutter code (Frontend)
│   ├── chatScreen.dart   # Chat UI and WebSocket client logic
│   ├── username.dart     # Screen to enter username
│   └── chat_model.dart   # (optional) model class for messages
│
├── server/               # FastAPI code (Backend)
│   └── main.py           # WebSocket server using FastAPI
│
├── pubspec.yaml          # Flutter dependencies
└── README.md
```

---

## ▶️ Getting Started

### 📡 Start Backend (FastAPI)

```bash
cd server
pip install fastapi uvicorn
uvicorn main:app --reload --host 0.0.0.0 --port 8080
```

### 📱 Start Frontend (Flutter)

```bash
flutter pub get
flutter run
```

Make sure your **Flutter app points to the correct IP** (`ws://<your-ip>:8080/ws`).

---

## 💬 How It Works

1. User enters their name and joins the chat.
2. Flutter connects to FastAPI server via WebSocket.
3. Messages are sent in format: `username: message`.
4. FastAPI receives and rebroadcasts the message to all clients.
5. Flutter clients update their UI in real-time with timestamps.

---

## 🧱 Built With

* ❤️ Flutter (Dart)
* ⚡ FastAPI (Python)
* 🔗 WebSocket Protocol

---

## 🧪 Learning Goals

✅ Understand real-time socket communication
✅ Use `WebSocketChannel` in Flutter
✅ Build a WebSocket server using FastAPI
✅ Learn how to structure messages, update UI live, and broadcast data

---

## 📌 Future Enhancements

* 💾 Save messages to file or database
* 🔐 Add authentication
* 📱 Build web support
* 🧑‍🤝‍🧑 Create chat rooms
* 🐳 Dockerize backend

---

## 📃 License

## 📃 License

This project is licensed under the [MIT License](LICENSE) by **Parikshit Verma** and **TechyCodex** – feel free to use, modify, and share it for learning or development purposes.


---
