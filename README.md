---

```markdown
# 💬 Flutter + FastAPI Real-Time Chat App

A real-time chat application built using **Flutter** (frontend) and **FastAPI** (backend), powered by **WebSocket** communication.  
This project demonstrates how to build a simple full-stack real-time system from scratch.

---

## 🎯 Project Overview

This project focuses on understanding and implementing **real-time communication** in a full-stack application.

It showcases how:
- A Flutter client connects to a WebSocket server
- FastAPI manages multiple real-time connections
- Messages are broadcasted instantly to all connected users
- UI updates dynamically based on incoming data

---

## 🚀 Features

- 🔁 Real-time messaging using WebSockets  
- 👤 Username-based chat entry  
- 📩 Message broadcasting to all connected clients  
- 🧭 Clear UI distinction between sender and receiver  
- 🕒 Timestamps for each message  
- 📚 Clean, modular, and easy-to-understand codebase  

---

## 🛠️ Tech Stack

| Layer      | Technology       |
|------------|------------------|
| Frontend   | Flutter (Dart)   |
| Backend    | FastAPI (Python) |
| Protocol   | WebSockets       |

---

## 📦 Folder Structure

```

├── lib/                  # Flutter frontend
│   ├── chatScreen.dart   # Chat UI + WebSocket logic
│   ├── username.dart     # Username input screen
│   └── chat_model.dart   # Message model
│
├── server/               # FastAPI backend
│   └── main.py           # WebSocket server
│
├── pubspec.yaml          # Flutter dependencies
└── README.md

````

---

## ▶️ Getting Started

### 📡 Run Backend (FastAPI)

```bash
cd server
pip install fastapi uvicorn
uvicorn main:app --reload --host 0.0.0.0 --port 8080
````

---

### 📱 Run Frontend (Flutter)

```bash
flutter pub get
flutter run
```

⚠️ Ensure the WebSocket URL in Flutter matches your system IP:

```
ws://<your-ip>:8080/ws
```

---

## 💬 How It Works

1. User enters a username and joins the chat.
2. Flutter establishes a WebSocket connection with the FastAPI server.
3. Messages are sent in the format:

   ```
   username: message
   ```
4. FastAPI receives the message and broadcasts it to all connected users.
5. Flutter updates the chat UI in real time with timestamps.

---

## 🧱 Built Using

* Flutter (Dart)
* FastAPI (Python)
* WebSocket Protocol

---

## 🧪 Key Learnings

* Implementing real-time communication using WebSockets
* Managing socket connections in FastAPI
* Building reactive UIs in Flutter
* Structuring a full-stack application cleanly
* Broadcasting data to multiple connected clients

---

## 🔮 Future Improvements

* 💾 Persist messages using a database
* 🔐 Add user authentication
* 🧑‍🤝‍🧑 Support multiple chat rooms
* 🌐 Enable Flutter Web support
* 🐳 Dockerize backend for deployment

---

## 👩‍💻 Author

Developed by **Anushka Sharma** as a full-stack learning project using Flutter and FastAPI.

```


