import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/constant/color_manager.dart';
import '../../../core/resources/constant/image_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notifications = true;
  bool _darkMode = true;
  bool _autoSave = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black6,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              /// 🔥 Header
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                ),
              ),

              SizedBox(height: 25.h),

              _buildProfileCard(),
              SizedBox(height: 20.h),

              _buildProCard(),
              SizedBox(height: 30.h),

              _buildSectionTitle("Preferences"),
              _buildCard([
                _buildSwitchTile(
                  "Notifications",
                  "Study reminders & updates",
                  Icons.notifications_outlined,
                  _notifications,
                  (v) => setState(() => _notifications = v),
                ),
                _divider(),
                _buildSwitchTile(
                  "Dark Mode",
                  "Midnight theme",
                  Icons.dark_mode_outlined,
                  _darkMode,
                  (v) => setState(() => _darkMode = v),
                ),
                _divider(),
                _buildSwitchTile(
                  "Auto Save",
                  "Save scanned docs",
                  Icons.save_alt_outlined,
                  _autoSave,
                  (v) => setState(() => _autoSave = v),
                ),
              ]),

              SizedBox(height: 25.h),

              _buildSectionTitle("Account"),
              _buildCard([
                _buildTile("Profile", Icons.person_outline),
                _divider(),
                _buildTile("Language", Icons.language),
                _divider(),
                _buildTile("Privacy & Security", Icons.lock_outline),
              ]),

              SizedBox(height: 25.h),

              _buildSectionTitle("Support"),
              _buildCard([_buildTile("Help Center", Icons.help_outline)]),

              SizedBox(height: 25.h),

              _buildSectionTitle("Danger Zone"),
              _buildCard([
                _buildTile("Sign Out", Icons.logout, color: Colors.redAccent),
              ]),

              SizedBox(height: 30.h),

              Center(
                child: Text(
                  "Scanthesis AI v2.4.1",
                  style: TextStyle(color: Colors.white38, fontSize: 12.sp),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 Profile Card (Premium)
  Widget _buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: _gradientCard(),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [ColorManager.purpleShade, Colors.deepPurpleAccent],
              ),
            ),
            child: CircleAvatar(
              radius: 28.r,
              backgroundImage: AssetImage(ImageManager.profileImg),
            ),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alex Johnson",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "alex@university.edu",
                style: TextStyle(color: Colors.white54, fontSize: 12.sp),
              ),
              SizedBox(height: 6.h),
              Text(
                "👑 Pro Student",
                style: TextStyle(color: Colors.amber, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔥 Pro Card (Glow Style)
  Widget _buildProCard() {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: _gradientCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Learnify Pro",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(40),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Active",
                  style: TextStyle(color: Colors.green, fontSize: 11.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          ...[
            "Unlimited scans",
            "Advanced AI",
            "Priority speed",
            "Cloud backup",
          ].map(
            (e) => Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Row(
                children: [
                  Icon(Icons.check_circle, size: 16.sp, color: Colors.green),
                  SizedBox(width: 8.w),
                  Text(
                    e,
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.white38,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  /// 🔥 Card Container
  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: _glassDecoration(),
      child: Column(children: children),
    );
  }

  /// 🔥 Switch Tile
  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      leading: Icon(icon, color: ColorManager.purpleShade, size: 20.sp),
      title: Text(
        title,
        style: TextStyle(color: ColorManager.white, fontSize: 14.sp),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white54, fontSize: 11.sp),
      ),
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: ColorManager.purpleShade,
        ),
      ),
    );
  }

  /// 🔥 Tile
  Widget _buildTile(String title, IconData icon, {Color? color}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      leading: Icon(
        icon,
        color: color ?? ColorManager.purpleShade,
        size: 20.sp,
      ),
      title: Text(
        title,
        style: TextStyle(color: color ?? ColorManager.white, fontSize: 14.sp),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.white38, size: 18.sp),
      onTap: () {},
    );
  }

  /// Divider
  Widget _divider() {
    return Divider(color: Colors.white.withOpacity(0.05), height: 1.h);
  }

  /// 🔥 Glass Effect
  BoxDecoration _glassDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(18.r),
      border: Border.all(color: Colors.white.withOpacity(0.05)),
    );
  }

  /// 🔥 Gradient Card (Premium Feel)
  BoxDecoration _gradientCard() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(18.r),
      gradient: LinearGradient(
        colors: [
          ColorManager.navbar.withOpacity(0.9),
          ColorManager.black6.withOpacity(0.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
