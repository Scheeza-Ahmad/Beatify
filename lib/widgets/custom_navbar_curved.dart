import 'package:beatify/screens/home_screen.dart';
import 'package:beatify/screens/liked_screen.dart';
import 'package:beatify/screens/new_drops.dart';
import 'package:beatify/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavCurvePainter extends CustomPainter {
  double insetRadius;

  BottomNavCurvePainter({this.insetRadius = 38});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(
      size.width * 0.20,
      0,
      insetCurveBeginnningX - transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(
      insetCurveBeginnningX,
      0,
      insetCurveBeginnningX,
      insetRadius / 2,
    );

    path.arcToPoint(
      Offset(insetCurveEndX, insetRadius / 2),
      radius: const Radius.circular(10.0),
      clockwise: false,
    );

    path.quadraticBezierTo(
      insetCurveEndX,
      0,
      insetCurveEndX + transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(0, size.height + 56);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomNavBarCurved extends StatefulWidget {
  const CustomNavBarCurved({super.key});

  @override
  CustomNavBarCurvedState createState() => CustomNavBarCurvedState();
}

class CustomNavBarCurvedState extends State<CustomNavBarCurved> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LikedScreen(),
    const NewDrops(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.black,
              Color(0xFF4A148C), // Dark purple gradient
            ],
          ),
        ),
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, height + 7),
              painter: BottomNavCurvePainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                backgroundColor: primaryColor,
                elevation: 0.1,
                onPressed: () {
                  // Floating button action
                },
                child: const Icon(CupertinoIcons.wind, color: Colors.black),
              ),
            ),
            SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarIcon(
                    text: "Home",
                    icon: CupertinoIcons.home,
                    selected: _selectedIndex == 0,
                    onPressed: () => _onNavBarItemTapped(0),
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                  ),
                  NavBarIcon(
                    text: "Liked",
                    icon: CupertinoIcons.heart,
                    selected: _selectedIndex == 1,
                    onPressed: () => _onNavBarItemTapped(1),
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                  ),
                  const SizedBox(width: 56),
                  NavBarIcon(
                    text: "Premium",
                    icon: Icons.workspace_premium_rounded,
                    selected: _selectedIndex == 2,
                    onPressed: () => _onNavBarItemTapped(2),
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                  ),
                  NavBarIcon(
                    text: "Profile",
                    icon: CupertinoIcons.person,
                    selected: _selectedIndex == 3,
                    onPressed: () => _onNavBarItemTapped(3),
                    selectedColor: primaryColor,
                    defaultColor: secondaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class NavBarIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  const NavBarIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = const Color(0xffFF8527),
    this.defaultColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: CircleAvatar(
        backgroundColor: selected
            ? const Color.fromARGB(255, 89, 25, 100)
            : Colors.transparent,
        child: Icon(
          icon,
          size: 25,
          color: selected ? Colors.black : defaultColor,
        ),
      ),
    );
  }
}
