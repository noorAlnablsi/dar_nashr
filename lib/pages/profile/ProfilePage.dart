import 'package:dar_nashr/pages/profile/edit_profile_page.dart';
import 'package:dar_nashr/services/profile_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileService _profileService = ProfileService();
  Map<String, dynamic>? profile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      final data = await _profileService.getProfile();
      setState(() {
        profile = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("حصل خطأ أثناء جلب البيانات"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text("صفحتي"),
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () async {
        final updated = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditProfilePage(profile: profile!),
          ),
        );

        if (updated == true) {
          _fetchProfile(); // رجع وحمّل البيانات الجديدة
        }
      },
    ),
  ],
),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : profile == null
              ? const Center(child: Text("لا توجد بيانات"))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // صورة البروفايل
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: profile!['profile_image'] != null
                            ? NetworkImage(profile!['profile_image'])
                            : null,
                        child: profile!['profile_image'] == null
                            ? const Icon(Icons.person, size: 50, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(height: 16),

                      // الاسم
                      Text(
                        profile!['username'] ?? 'غير معروف',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // البريد الالكتروني
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email, size: 18, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(profile!['email'] ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // رقم الهاتف
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone, size: 18, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(profile!['phone_number'] ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // النبذة
                      if (profile!['bio'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "نبذة عني",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(profile!['bio']),
                            const SizedBox(height: 16),
                          ],
                        ),

                      // المهارات
                      if (profile!['skills'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "مهاراتي",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(profile!['skills']),
                            const SizedBox(height: 16),
                          ],
                        ),

                      // عدد الكتب المنشورة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.book, color: Colors.brown),
                          const SizedBox(width: 6),
                          Text("عدد الكتب المنشورة: ${profile!['published_books_count'] ?? 0}"),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
