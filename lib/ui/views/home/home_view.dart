import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Web App Manager'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: viewModel.showInfo,
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: viewModel.logout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.architecture, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          'Stacked Architecture',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'This Flutter web app demonstrates the Stacked architecture pattern with:'
                    ),
                    const SizedBox(height: 8),
                    const _FeatureTile(
                      icon: Icons.route,
                      text: 'Auto-generated routing',
                    ),
                    const _FeatureTile(
                      icon: Icons.memory,
                      text: 'Dependency injection',
                    ),
                    const _FeatureTile(
                      icon: Icons.layers,
                      text: 'MVVM pattern implementation',
                    ),
                    const _FeatureTile(
                      icon: Icons.build,
                      text: 'Code generation with build_runner',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: viewModel.incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increment Counter'),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Counter Value:'),
                    Text(
                      '${viewModel.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Built with Flutter & Stacked',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.resetCounter,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
