import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:mobile/screens/add_item_screen.dart';
import 'package:mobile/services/closet_database.dart';
import 'package:mobile/utils/app_colors.dart';
import 'package:mobile/utils/glass_container.dart';
import 'package:mobile/viewmodels/auth_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  Future<void> _navigateToAddItem() async {
    await Navigator.push<bool>(
      context,
      platformPageRoute(
        context: context,
        builder: (_) => const AddItemScreen(),
      ),
    );
    // TODO: refresh item list when data binding is wired up
  }

  void _openDbViewer() {
    Navigator.push(
      context,
      platformPageRoute(
        context: context,
        builder: (_) => DriftDbViewer(ClosetDatabase()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(widget.title),
        trailingActions: [
          if (kDebugMode)
            PlatformIconButton(
              icon: const Icon(Icons.storage_outlined),
              onPressed: _openDbViewer,
              cupertino: (_, _) =>
                  CupertinoIconButtonData(padding: EdgeInsets.zero),
            ),
          PlatformIconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
            cupertino: (_, _) =>
                CupertinoIconButtonData(padding: EdgeInsets.zero),
          ),
          PlatformIconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
            cupertino: (_, _) =>
                CupertinoIconButtonData(padding: EdgeInsets.zero),
          ),
        ],
        cupertino: (_, _) => CupertinoNavigationBarData(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (kDebugMode)
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _openDbViewer,
                  child: const Icon(CupertinoIcons.table, size: 20),
                ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Icon(CupertinoIcons.square_arrow_right, size: 22),
              ),
              CupertinoButton(
                padding: const EdgeInsets.only(left: 4),
                onPressed: _navigateToAddItem,
                child: const Icon(CupertinoIcons.add, size: 26),
              ),
            ],
          ),
        ),
      ),
      body: Material(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFDDE8F8), Color(0xFFEDE6F6), Color(0xFFD6EEF8)],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, ${context.watch<AuthViewModel>().user?.displayName?.split(' ').first ?? ''} 👋',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your Wardrobe',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 38,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryChip('All', true),
                      _buildCategoryChip('Shirts', false),
                      _buildCategoryChip('Pants', false),
                      _buildCategoryChip('Shoes', false),
                      _buildCategoryChip('Accessories', false),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) => _buildItemCard(index),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavBar: PlatformNavBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        itemChanged: (index) => setState(() => _selectedIndex = index),
        material: (_, _) => MaterialNavBarData(
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
        ),
        cupertino: (_, _) => CupertinoTabBarData(
          activeColor: AppColors.primary,
          inactiveColor: AppColors.textSecondary,
        ),
      ),
      material: (_, _) => MaterialScaffoldData(
        floatingActionButton: FloatingActionButton(
          onPressed: _navigateToAddItem,
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GlassContainer(
        blur: 15,
        opacity: isSelected ? 0.35 : 0.18,
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(int index) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white.withValues(alpha: 0.25),
                child: const Center(
                  child: Icon(
                    Icons.checkroom_outlined,
                    color: AppColors.greyMedium,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Name $index',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Category',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
