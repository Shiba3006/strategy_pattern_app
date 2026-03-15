import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'models/payment_strategy.dart';

void main() {
  setupDI();
  runApp(const StrategyPatternApp());
}

class StrategyPatternApp extends StatelessWidget {
  const StrategyPatternApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strategy Pattern',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late CheckoutService _checkout;
  String _selectedMethod = 'card';

  @override
  void initState() {
    super.initState();
    _checkout = CheckoutService.switchStrategy(_selectedMethod);
  }

  void _onMethodChanged(String method) {
    setState(() {
      _selectedMethod = method;
      _checkout = CheckoutService.switchStrategy(method);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UI picks a method, service switches strategy
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'card', label: Text('Card')),
                  ButtonSegment(value: 'wallet', label: Text('Wallet')),
                  ButtonSegment(value: 'instapay', label: Text('InstaPay')),
                ],
                selected: {_selectedMethod},
                onSelectionChanged: (val) => _onMethodChanged(val.first),
              ),
              ElevatedButton(
                onPressed: () => _checkout.checkout(99.99),
                child: const Text('Pay now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
