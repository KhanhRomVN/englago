import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/subject_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
};

// Thêm một hàm để xử lý route động cho SubjectPage
Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name?.startsWith('/subject/') ?? false) {
    final subjectName = settings.name!.split('/').last;
    return MaterialPageRoute(
      builder: (context) => SubjectPage(subjectName: subjectName),
    );
  }
  // Xử lý các route khác nếu cần
  return MaterialPageRoute(builder: (context) => HomePage());
}
