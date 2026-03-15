# Strategy Pattern + get_it — Flutter Demo

A Flutter app demonstrating the **Strategy Pattern** from Head First Design Patterns,
integrated with `get_it` for dependency injection.

## What this app shows

- How to define a `PaymentStrategy` abstraction
- How to implement multiple concrete strategies (`CardPayment`, `WalletPayment`, `InstapayPayment`)
- How to register strategies in `get_it` under the same type with different instance names
- How `CheckoutService` depends only on the abstraction — never on a concrete class
- How to swap strategies at runtime without touching the service or the UI

## Key design principle

> Depend on abstractions, not implementations.

The Strategy Pattern handles the design.
`get_it` handles the wiring across the app.

## Project structure
```
lib/
├── main.dart
├── injection.dart          # get_it registration
├── models/
│   └── payment_strategy.dart   # abstract class + concrete implementations
└── services/
    └── checkout_service.dart   # depends only on PaymentStrategy
```

## Getting started
```bash
flutter pub get
flutter run
```

## Dependencies

- [get_it](https://pub.dev/packages/get_it) — service locator / dependency injection

## Related

Based on Chapter 1 of *Head First Design Patterns* by Freeman & Robson (O'Reilly).