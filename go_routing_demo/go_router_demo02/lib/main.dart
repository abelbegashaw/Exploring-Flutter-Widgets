import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/products/42?filter=popular'),
          child: Text('Go to Details'),
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String id;
  final String filter;
  const ProductDetailsScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product $id')),
      body: Text('Showing product $id\n with filter $filter'),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Lesson 2',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(const MyApp());

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/products/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final filter = state.uri.queryParameters['filter'] ?? 'all';
        return ProductDetailsScreen(id: id, filter: filter);
      },
    ),
  ],
);
