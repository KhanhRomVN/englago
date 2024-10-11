import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: child,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      backgroundColor: Color(0xFF12332C),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)!.settings.name ?? '/';

    return Container(
      height: 60, // Chiều cao cố định cho thanh điều hướng
      decoration: BoxDecoration(
        color: Colors.white, // Thay đổi màu nền thành trắng
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            route: '/',
            currentRoute: currentRoute,
          ),
          _NavItem(
            icon: Icons.add_circle_rounded,
            label: 'Add',
            route: '/add',
            currentRoute: currentRoute,
          ),
          _NavItem(
            icon: Icons.library_books_rounded,
            label: 'Library',
            route: '/library',
            currentRoute: currentRoute,
          ),
          _NavItem(
            icon: Icons.settings_rounded,
            label: 'Settings',
            route: '/settings',
            currentRoute: currentRoute,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String currentRoute;
  final bool isMiddle;

  const _NavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
    this.isMiddle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = route == currentRoute;
    final Color itemColor = isMiddle
        ? Colors.greenAccent
        : (isSelected ? Color(0xFFA6C9C3) : Color(0xFF88a4a4));

    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.greenAccent.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: itemColor,
              size: isMiddle ? 28 : 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: itemColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
