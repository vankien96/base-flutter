# Base flutter App Architecture
## Clean Architecture

### Commons
- It contains common extensions, libs, Const and some common struct
### Core
- It contains the core logic of network. such as http service, auth service, api configuration
### Data
- It contains repositories implement. Use for retrieve data from API or local.
### Domain
- It will contains the core business logic (use cases), core business of repositories, and models
### Presentation
- It contains UI and BLoC.

# Tech stack

### Flutter 3.10.5. Channel stable
### Dart version 3.0.5


### State Management: BLoC
### Localization: flutter_i18n
### Dependency Injection: get_it
### Local database: hive
### Network: dio (A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.)

# How to run:
- flutter channel stable
- flutter pub get
- flutter packages pub run build_runner build
