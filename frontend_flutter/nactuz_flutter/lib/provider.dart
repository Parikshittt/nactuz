import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the list of items in the cart
final itemsInCartProvider = StateProvider<List<dynamic>>((ref) => []);

// Provider for the counter, which depends on the items in the cart
final counterProvider = Provider<int>((ref) {
  final itemsInCart = ref.watch(itemsInCartProvider);
  return itemsInCart.length;
});

//Provider for the student's name
final studentName = Provider<String>((ref) {
  return 'Parikshit';
});

//Provider for student's address
final studentFullAddress = Provider<String>((ref) {
  return 'Panchkula, Haryana';
});

//Provider to store phone number at login/signUp screen
final studentPhoneNumber = StateProvider<String>((ref)=>'');

