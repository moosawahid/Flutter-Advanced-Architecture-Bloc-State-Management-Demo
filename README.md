# 📊 Flutter Advanced Architecture & Bloc State Management Demo

A comprehensive Flutter application demonstrating enterprise-level architecture patterns, advanced Bloc state management, and professional data visualisation with UK currency support.

## 🚀 Key Features

- **Bloc State Management** - Complete implementation with Events, States, and Bloc classes
- **Clean Architecture** - Proper separation of Domain, Data, and Presentation layers
- **Repository Pattern** - Data abstraction with remote and local data sources
- **Dependency Injection** - GetIt service locator for managing dependencies
- **Professional Charts** - Line charts, bar charts, and pie charts with fl_chart
- **Error Handling** - Loading, success, and error states with retry functionality
- **UK Currency Formatting** - Proper £ symbol usage throughout the app
- **Material 3 Design** - Modern UI with responsive layouts

## 🛠️ Technical Stack

- **Flutter** - Cross-platform UI framework
- **flutter_bloc** - State management with Bloc pattern
- **bloc** - Core Bloc library for state management
- **equatable** - Value equality for state objects
- **get_it** - Dependency injection service locator
- **dio** - HTTP client for API communication
- **fl_chart** - Professional chart library
- **json_annotation** - JSON serialisation
- **intl** - Internationalisation and formatting

## 📁 Clean Architecture Structure

```
lib/
├── core/
│   ├── domain/
│   │   ├── entities/        # Business entities (ChartData, CategoryData, DashboardMetrics)
│   │   ├── repositories/    # Abstract repository interfaces
│   │   └── usecases/        # Business logic use cases
│   ├── data/
│   │   ├── datasources/     # Remote and local data sources
│   │   └── repositories/    # Repository implementations
│   ├── presentation/
│   │   └── bloc/           # Bloc state management (Events, States, Bloc)
│   └── di/
│       └── injection.dart  # Dependency injection configuration
├── screens/
│   └── dashboard_screen.dart # Main dashboard UI
├── widgets/
│   ├── sales_chart.dart     # Line chart widget
│   ├── revenue_chart.dart   # Bar chart widget
│   └── category_pie_chart.dart # Pie chart widget
└── main.dart               # Application entry point
```

## 🎯 Interview Topics Covered

This project demonstrates enterprise-level Flutter development skills:

### **State Management Patterns:**
- ✅ **Bloc Pattern** - Complete implementation with Events, States, and Bloc classes
- ✅ **Event-Driven Architecture** - LoadDashboardData and RefreshDashboardData events
- ✅ **State Management** - DashboardInitial, DashboardLoading, DashboardLoaded, DashboardError states
- ✅ **Unidirectional Data Flow** - Events flow down, states flow up

### **Data Management:**
- ✅ **REST API** - HTTP client implementation with Dio
- ✅ **Local Database** - SharedPreferences for data persistence
- ✅ **Offline-first** - Repository pattern with caching strategy
- ✅ **Data Sources** - Remote and local data source abstraction

### **Architecture Patterns:**
- ✅ **Clean Architecture** - Domain, Data, and Presentation layers
- ✅ **Repository Pattern** - Data abstraction with concrete implementations
- ✅ **Dependency Injection** - GetIt service locator pattern
- ✅ **Use Cases** - Business logic encapsulation

### **Advanced Features:**
- ✅ **Error Handling** - Comprehensive error states and retry mechanisms
- ✅ **Data Visualisation** - Professional charts with fl_chart
- ✅ **JSON Serialisation** - Automatic code generation
- ✅ **Internationalisation** - UK currency formatting

## 🚀 Getting Started

1. **Setup dependencies:**
   ```bash
   cd flutter_advanced_architecture_demo
   flutter pub get
   ```

2. **Generate code:**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

## 📊 Bloc State Management Implementation

### **Events:**
- `LoadDashboardData` - Initial data loading event
- `RefreshDashboardData` - Manual refresh event

### **States:**
- `DashboardInitial` - Initial state when app starts
- `DashboardLoading` - Loading state with progress indicator
- `DashboardLoaded` - Success state with data display
- `DashboardError` - Error state with retry functionality

### **Bloc Class:**
- `DashboardBloc` - Main state management class
- Event handlers for data loading and refresh
- Error handling with try-catch blocks
- State transitions based on data loading results

## 📊 Implemented Features

### **Data Visualisation:**
- **Line Chart** - Sales trend over time with interactive tooltips
- **Bar Chart** - Monthly revenue comparison with custom styling
- **Pie Chart** - Category breakdown with horizontal legend

### **State Management:**
- **Bloc Pattern** - Complete implementation with events, states, and bloc
- **Error Handling** - Loading, success, and error states with retry functionality
- **Data Flow** - Unidirectional data flow from repository to UI

### **Architecture:**
- **Clean Architecture** - Separation of concerns across layers
- **Repository Pattern** - Data abstraction with remote and local sources
- **Dependency Injection** - Service locator pattern with GetIt

### **Data Management:**
- **HTTP Client** - Dio for API communication
- **JSON Serialisation** - Automatic code generation
- **Caching Strategy** - Repository-level data persistence
- **Error Recovery** - Fallback to cached data on network failure

## 🎯 What I've Learned

Building this project helped me understand:
- How to structure a Flutter app using Clean Architecture principles
- Implementing proper state management with the Bloc pattern
- Creating maintainable code with dependency injection
- Handling errors gracefully in production applications
- Building professional data visualisation components

## 📱 Platform Support

- ✅ **Android** - Tested on Android 15 (API 35)
- ✅ **iOS** - Compatible with iOS 18.6.2
- ✅ **Web** - Responsive design for browsers
- ✅ **Desktop** - Native desktop application support

## 🔧 Development Notes

This project was built to demonstrate advanced Flutter concepts commonly asked about in technical interviews. The code follows industry best practices and can serve as a reference for similar projects.

---

**Built with Flutter for demonstrating advanced architecture patterns! 🚀**