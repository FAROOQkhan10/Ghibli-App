# Ghibli-App 🎬

A Studio Ghibli movie discovery app built with **Swift and SwiftUI**. Explore Studio Ghibli films, view movie details and characters, search for movies, and manage your favorite films.

## 📱 Screenshots

<div>
  <img src="https://github.com/FAROOQkhan10/Ghibli-App/blob/main/Screenshots/img2.png" width="250">
  <img src="https://github.com/FAROOQkhan10/Ghibli-App/blob/main/Screenshots/img1.png" width="250">
  <img src="https://github.com/FAROOQkhan10/Ghibli-App/blob/main/Screenshots/img3.png" width="250">
  <img src="https://github.com/FAROOQkhan10/Ghibli-App/blob/main/Screenshots/img4.png" width="250">
  <img src="https://github.com/FAROOQkhan10/Ghibli-App/blob/main/Screenshots/img5.png" width="250">
</div>

## ✨ Features

- **Browse Movies:** Explore Studio Ghibli films and their details.
- **Movie Details:** View information about individual films.
- **Character Information:** Explore characters associated with movies.
- **Search Movies:** Find films using the search functionality.
- **Favorites:** Add and remove movies from your favorites list.
- **API Integration:** Fetch movie and character data from a REST API.
- **SwiftUI Interface:** Build a native iOS experience with declarative UI.

## 🛠️ Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Architecture:** Model-View-ViewModel (MVVM)
- **Networking:** REST API, HTTP requests, JSON decoding
- **Concurrency:** Swift Concurrency (`async`/`await`)
- **API:** [Studio Ghibli API](https://ghibliapi.vercel.app/)

## 🏗️ Architecture

The application follows the **MVVM (Model-View-ViewModel)** architecture to separate UI presentation, application logic, data models, and API communication.

- **Models:** Represent film and character data.
- **Views:** Display the app interface using SwiftUI.
- **ViewModels:** Manage view state, user interactions, and presentation logic.
- **Services:** Handle API requests and favorite-related operations.
- **Protocols:** Define service contracts and support dependency injection.

## 🌐 API

This application uses the [Studio Ghibli API](https://ghibliapi.vercel.app/) to retrieve film and character information.

Example endpoints:

- Films: `https://ghibliapi.vercel.app/films`
- People: `https://ghibliapi.vercel.app/people`

The API provides Studio Ghibli film and character data through HTTP requests and JSON responses.

## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/FAROOQkhan10/Ghibli-App.git
   ```

2. Open the project in Xcode:

   ```bash
   cd Ghibli-App
   open GhibliApp.xcodeproj
   ```

3. Select an iOS Simulator or a connected iPhone.
4. Build and run the application from Xcode.

## 📂 Project Structure

```text
GhibliApp/
├── Core/
│   ├── Components/
│   ├── ViewModels/
│   └── Views/
├── Models/
├── Services/
│   └── Protocols/
├── Utility/
└── GhibliApp.swift
```

## 🎯 What I Practiced

- Implementing MVVM architecture in SwiftUI.
- Integrating REST APIs and decoding JSON responses.
- Managing asynchronous network requests using `async`/`await`.
- Using protocols to abstract service implementations.
- Managing loading, success, and error states.
- Implementing movie search and favorites functionality.

## 📄 License

This project was created for learning and portfolio purposes. Studio Ghibli film data is provided by the [Studio Ghibli API](https://ghibliapi.vercel.app/).
