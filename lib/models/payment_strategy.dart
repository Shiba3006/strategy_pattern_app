// Payment strategy
import '../di/injection.dart';

abstract class PaymentStrategy {
  const PaymentStrategy();
  void pay(double amount);
}

class CardPayment implements PaymentStrategy {
  const CardPayment();

  @override
  void pay(double amount) async {
    print('Charging \$amount to card ');
  }
}

class WalletPayment implements PaymentStrategy {
  const WalletPayment();
  @override
  void pay(double amount) async {
    print('Paying \$amount from in-app wallet');
  }
}

class InstapayPayment implements PaymentStrategy {
  const InstapayPayment();
  @override
  void pay(double amount) async {
    print('Paying \$amount via InstaPay 🇪🇬');
  }
}

// The checkout context — doesn't care HOW payment works
class CheckoutService {
  final PaymentStrategy _strategy;

  const CheckoutService({required PaymentStrategy strategy})
    : _strategy = strategy;

  CheckoutService.switchStrategy(String method)
    : _strategy = getIt<PaymentStrategy>(instanceName: method);

  Future<void> checkout(double amount) async {
    final success = _strategy.pay(amount);
    print('Payment successful ✅');
  }
}
