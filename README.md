<<<<<<< HEAD
# watchlistappsangeerth

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Watchlist Reorder App (Flutter - BLoC)

## Overview

This project is a Flutter implementation of a stock watchlist where users can reorder stocks using drag and drop. The main focus of this assignment was to implement proper state management using BLoC and maintain clean, scalable code structure.

The UI is based on a trading watchlist style similar to the 021 Trade application.

---

## Features

- Reorder stocks using drag and drop
- Delete stocks from the watchlist
- Clean state management using BLoC
- Responsive UI layout
- Smooth and stable list updates
- Modular widget structure

---

## Approach

The main goal was to keep the logic simple and predictable.

- Used 'flutter_bloc' for state management
- Maintained stock list as immutable state
- Used 'ReorderableListView.builder' for drag and drop
- Handled reorder logic using 'oldIndex' and 'newIndex'
- Updated list inside Bloc and emitted new state

The reorder logic ensures the list updates correctly without breaking the UI or causing index mismatch issues.

>>>>>>> 5a2d54c3ee7f4a0aa8c3e59af6c5789fa4b0e41d
