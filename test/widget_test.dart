import 'package:flutter_test/flutter_test.dart';
import 'package:my_project_name/solution_challenege_two/solution_challenge_two.dart';
import 'package:my_project_name/solution_challenge_one/solution_challenge_one.dart';  // Corrected import
import 'package:my_project_name/solution_challenge_three/solution_challenge_three.dart';  // Corrected import
import 'package:my_project_name/main.dart';  // Import your main app

void main() {
  testWidgets('Tab navigation works correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the first tab (Solution 1) is displayed initially.
    expect(find.text('Solution 1'), findsOneWidget);
    expect(find.byType(NumberWordConverter), findsOneWidget);  // Make sure this matches your class name

    // Switch to the second tab (Solution 2).
    await tester.tap(find.text('Solution 2'));
    await tester.pumpAndSettle(); // Wait for the animations to finish

    // Verify that the second tab (Solution 2) is displayed.
    expect(find.byType(TowerGame), findsOneWidget);  // Ensure this matches the class name

    // Switch to the third tab (Solution 3).
    await tester.tap(find.text('Solution 3'));
    await tester.pumpAndSettle(); // Wait for the animations to finish

    // Verify that the third tab (Solution 3) is displayed.
    expect(find.byType(NumerologyCalculator), findsOneWidget);  // Ensure this matches the class name
  });
}
