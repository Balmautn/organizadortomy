import 'package:flutter_test/flutter_test.dart';
import 'package:mi_organizador/main.dart';

void main() {
  testWidgets('muestra el nombre de la aplicación y navegación', (tester) async {
    await tester.pumpWidget(const MiOrganizadorApp());
    await tester.pumpAndSettle();
    expect(find.text('Mi Organizador'), findsOneWidget);
    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Calendario'), findsOneWidget);
  });
}
