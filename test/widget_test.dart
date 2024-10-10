import 'package:flutter_test/flutter_test.dart';
import 'package:my_project_name/solution_challenge_two/solution_challenge_two.dart';
import 'package:my_project_name/solution_challenge_one/solution_challenge_one.dart'; 
import 'package:my_project_name/solution_challenge_three/solution_challenge_three.dart';  
import 'package:my_project_name/main.dart'; 

void main() {
  testWidgets('Tab navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Solution 1'), findsOneWidget);
    expect(find.byType(NumberWordConverter), findsOneWidget);  

    await tester.tap(find.text('Solution 2'));
    await tester.pumpAndSettle(); 

    expect(find.byType(TowerGame), findsOneWidget); 

    await tester.tap(find.text('Solution 3'));
    await tester.pumpAndSettle();

    expect(find.byType(NumerologyCalculator), findsOneWidget); 
  });
}
