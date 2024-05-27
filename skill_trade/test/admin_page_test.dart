import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/reported_technicians.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/technicians_list.dart';

void main() {
  group('AdminSiteLogic Unit Tests', () {
    test('Initial current index is 0', () {
      final logic = AdminSiteLogic();
      expect(logic.currentIndex, 0);
    });

    test('onItemTapped sets current index correctly', () {
      final logic = AdminSiteLogic();

      // Simulate navigation to index 1
      logic.onItemTapped(1);
      expect(logic.currentIndex, 1);

      // Simulate navigation to index 2
      logic.onItemTapped(2);
      expect(logic.currentIndex, 2);
    });

    test('Correct page is returned for each current index', () {
      final logic = AdminSiteLogic();

      logic.onItemTapped(0);
      var currentPage = logic.getCurrentPage();
      expect(currentPage, isA<AdminPage>());

      logic.onItemTapped(1);
      currentPage = logic.getCurrentPage();
      expect(currentPage, isA<ReportedTechnicians>());

      logic.onItemTapped(2);
      currentPage = logic.getCurrentPage();
      expect(currentPage, isA<AdminCustomer>());

      logic.onItemTapped(3);
      currentPage = logic.getCurrentPage();
      expect(currentPage, isA<TechniciansList>());
    });
  });
}
