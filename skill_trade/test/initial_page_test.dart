import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/main.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/home_page.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/technician.dart';

void main() {
  group('GetFirstPageLogic Unit Tests', () {
    test('Returns CustomerPage for customer role', () {
      final logic = GetFirstPageLogic();
      var page = logic.getLoggedInPage("customer");
      expect(page, isA<CustomerPage>());
    });

    test('Returns TechnicianPage for technician role', () {
      final logic = GetFirstPageLogic();
      var page = logic.getLoggedInPage("technician");
      expect(page, isA<TechnicianPage>());
    });

    test('Returns AdminPage for admin role', () {
      final logic = GetFirstPageLogic();
      var page = logic.getLoggedInPage("admin");
      expect(page, isA<AdminPage>());
    });

    test('Returns HomeScreen for unknown role', () {
      final logic = GetFirstPageLogic();
      var page = logic.getLoggedInPage("unknown");
      expect(page, isA<HomeScreen>());
    });
  });
}