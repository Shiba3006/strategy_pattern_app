// injection.dart
import 'package:get_it/get_it.dart';

import '../models/payment_strategy.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Register each concrete strategy under the SAME abstraction
  // but with different instance names
  getIt.registerFactory<PaymentStrategy>(
    () => CardPayment(),
    instanceName: 'card',
  );

  getIt.registerFactory<PaymentStrategy>(
    () => WalletPayment(),
    instanceName: 'wallet',
  );

  getIt.registerFactory<PaymentStrategy>(
    () => InstapayPayment(),
    instanceName: 'instapay',
  );

  getIt.registerFactory<CheckoutService>(
    () =>
        CheckoutService(strategy: getIt<PaymentStrategy>(instanceName: 'card')),
  );
}
