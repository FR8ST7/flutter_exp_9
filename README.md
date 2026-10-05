# Experiment 9 – Accessing APIs Through HTTP

## Aim
To access a REST API using HTTP and display JSON data in Flutter.

## Steps Implemented
1. **Create App**: Created separate Flutter app directory `api_app`.
2. **Add HTTP Package**: Included `http: ^1.2.0` in `pubspec.yaml`.
3. **Import Packages**: `import 'dart:convert';` and `import 'package:http/http.dart' as http;`.
4. **Create API Function**:
   ```dart
   Future<void> fetchData() async {
     final response = await http.get(
       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
     );
     if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       print(data);
     } else {
       print('Failed to load data');
     }
   }
   ```
5. **Call Function**: Triggered on component mount (`initState`).
6. **Display API Data**: Rendered posts using `ListView.builder`.
7. **Handle Loading**: Displayed progress indicator while fetching data.
8. **Handle Errors**: Rendered fallback UI with retry capability on failure.

## Deployment & Live Demo
- **GitHub Repository**: `FR8ST7/flutter_exp_9`
- **Live Demo**: [https://fr8st7.github.io/flutter_exp_9/](https://fr8st7.github.io/flutter_exp_9/)
