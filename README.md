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

