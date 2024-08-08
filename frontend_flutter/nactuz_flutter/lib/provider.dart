import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Provider for the list of items in the wishlist
final itemsInWishlistProvider = StateProvider<List<dynamic>>((ref) => []);

// Provider for the counter, which depends on the items in the wishlist
final counterProvider = Provider<int>((ref) {
  final itemsInWishlist = ref.watch(itemsInWishlistProvider);
  return itemsInWishlist.length;
});

// Provider for the student's name
final studentName = Provider<String>((ref) {
  return 'Parikshit';
});

// Provider for student's address
final studentFullAddress = Provider<String>((ref) {
  return 'Panchkula, Haryana';
});

// Provider to store phone number at login/signup screen
final studentPhoneNumber = StateProvider<String>((ref) => '');

// Provider to manage login state
final isUserLoggedIn = StateProvider<bool>((ref) => false);

// Provider for user type
final userTypeProvider = StateProvider<String>((ref) => 'student'); // Default to 'student'

// Provider for FlutterSecureStorage (Provider for sync initialization)
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

