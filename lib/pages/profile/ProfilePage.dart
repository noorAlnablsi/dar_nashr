// // import 'package:dar_nashr/pages/profile/edit_profile_page.dart';
// // import 'package:dar_nashr/services/profile_service.dart';
// // import 'package:flutter/material.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final ProfileService _profileService = ProfileService();
// //   Map<String, dynamic>? profile;
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchProfile();
// //   }

// //   Future<void> _fetchProfile() async {
// //     try {
// //       final data = await _profileService.getProfile();
// //       setState(() {
// //         profile = data;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("حصل خطأ أثناء جلب البيانات"),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //   title: const Text("صفحتي"),
// //   centerTitle: true,
// //   actions: [
// //     IconButton(
// //       icon: const Icon(Icons.edit),
// //       onPressed: () async {
// //         final updated = await Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (_) => EditProfilePage(profile: profile!),
// //           ),
// //         );

// //         if (updated == true) {
// //           _fetchProfile(); // رجع وحمّل البيانات الجديدة
// //         }
// //       },
// //     ),
// //   ],
// // ),

// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : profile == null
// //               ? const Center(child: Text("لا توجد بيانات"))
// //               : SingleChildScrollView(
// //                   padding: const EdgeInsets.all(16),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       // صورة البروفايل
// //                       CircleAvatar(
// //                         radius: 50,
// //                         backgroundColor: Colors.grey.shade300,
// //                         backgroundImage: profile!['profile_image'] != null
// //                             ? NetworkImage(profile!['profile_image'])
// //                             : null,
// //                         child: profile!['profile_image'] == null
// //                             ? const Icon(Icons.person, size: 50, color: Colors.white)
// //                             : null,
// //                       ),
// //                       const SizedBox(height: 16),

// //                       // الاسم
// //                       Text(
// //                         profile!['username'] ?? 'غير معروف',
// //                         style: const TextStyle(
// //                           fontSize: 22,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),

// //                       // البريد الالكتروني
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Icon(Icons.email, size: 18, color: Colors.grey),
// //                           const SizedBox(width: 6),
// //                           Text(profile!['email'] ?? '-'),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 8),

// //                       // رقم الهاتف
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Icon(Icons.phone, size: 18, color: Colors.grey),
// //                           const SizedBox(width: 6),
// //                           Text(profile!['phone_number'] ?? '-'),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 16),

// //                       // النبذة
// //                       if (profile!['bio'] != null)
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               "نبذة عني",
// //                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// //                             ),
// //                             const SizedBox(height: 8),
// //                             Text(profile!['bio']),
// //                             const SizedBox(height: 16),
// //                           ],
// //                         ),

// //                       // المهارات
// //                       if (profile!['skills'] != null)
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               "مهاراتي",
// //                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// //                             ),
// //                             const SizedBox(height: 8),
// //                             Text(profile!['skills']),
// //                             const SizedBox(height: 16),
// //                           ],
// //                         ),

// //                       // عدد الكتب المنشورة
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Icon(Icons.book, color: Colors.brown),
// //                           const SizedBox(width: 6),
// //                           Text("عدد الكتب المنشورة: ${profile!['published_books_count'] ?? 0}"),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //     );
// //   }
// // }




// import 'package:dar_nashr/pages/profile/edit_profile_page.dart';
// import 'package:dar_nashr/services/profile_service.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final ProfileService _profileService = ProfileService();
//   Map<String, dynamic>? profile;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchProfile();
//   }

//   Future<void> _fetchProfile() async {
//     try {
//       final data = await _profileService.getProfile();
//       setState(() {
//         profile = data;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("حصل خطأ أثناء جلب البيانات"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("صفحتي"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () async {
//               if (profile == null) return;
//               final updated = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => EditProfilePage(profile: profile!),
//                 ),
//               );

//               if (updated == true) {
//                 _fetchProfile(); // رجع وحمّل البيانات الجديدة
//               }
//             },
//           ),
//         ],
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : profile == null
//               ? const Center(child: Text("لا توجد بيانات"))
//               : SingleChildScrollView(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.grey.shade300,
//                         backgroundImage: profile!['profile_image'] != null
//                             ? NetworkImage(profile!['profile_image'])
//                             : null,
//                         child: profile!['profile_image'] == null
//                             ? const Icon(Icons.person, size: 50, color: Colors.white)
//                             : null,
//                       ),
//                       const SizedBox(height: 16),

//                       Text(
//                         profile!['username'] ?? 'غير معروف',
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.email, size: 18, color: Colors.grey),
//                           const SizedBox(width: 6),
//                           Text(profile!['email'] ?? '-'),
//                         ],
//                       ),
//                       const SizedBox(height: 8),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.phone, size: 18, color: Colors.grey),
//                           const SizedBox(width: 6),
//                           Text(profile!['phone_number'] ?? '-'),
//                         ],
//                       ),
//                       const SizedBox(height: 16),

//                       if (profile!['bio'] != null)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "نبذة عني",
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(profile!['bio']),
//                             const SizedBox(height: 16),
//                           ],
//                         ),

//                       if (profile!['social_links'] != null &&
//                           profile!['social_links'].toString().isNotEmpty)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "روابط التواصل",
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                             ),
//                             const SizedBox(height: 8),
//                             InkWell(
//                               onTap: () {
//                                 // ممكن تفتح الرابط بالـ url_launcher
//                               },
//                               child: Text(
//                                 profile!['social_links'],
//                                 style: const TextStyle(
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                           ],
//                         ),

//                       if (profile!['skills'] != null)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "مهاراتي",
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(profile!['skills']),
//                             const SizedBox(height: 16),
//                           ],
//                         ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.book, color: Color.fromARGB(255, 149, 101, 84)),
//                           const SizedBox(width: 6),
//                           Text("عدد الكتب المنشورة: ${profile!['published_books_count'] ?? 0}"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//     );
//   }
// }


import 'package:dar_nashr/pages/profile/edit_profile_page.dart';
import 'package:dar_nashr/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:dar_nashr/core/resources/color.dart';

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
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text("صفحتي"),
        centerTitle: true,
       // backgroundColor: AppColors.primary,
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
                        radius: 55,
                        backgroundColor: AppColors.secondary,
                        backgroundImage: profile!['profile_image'] != null
                            ? NetworkImage(profile!['profile_image'])
                            : null,
                        child: profile!['profile_image'] == null
                            ? const Icon(Icons.person,
                                size: 55, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(height: 16),

                      // الاسم
                      Text(
                        profile!['username'] ?? 'غير معروف',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // البريد الالكتروني
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email,
                              size: 18, color: AppColors.onPrimary),
                          const SizedBox(width: 6),
                          Text(profile!['email'] ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // رقم الهاتف
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone,
                              size: 18, color: AppColors.onPrimary),
                          const SizedBox(width: 6),
                          Text(profile!['phone_number'] ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // نبذة
                      if (profile!['bio'] != null)
                        _buildCard(
                          title: "نبذة عني",
                          child: Text(
                            profile!['bio'],
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              height: 1.5,
                            ),
                          ),
                        ),

                      // روابط التواصل
                      if (profile!['social_links'] != null &&
                          profile!['social_links'].toString().isNotEmpty)
                        _buildCard(
                          title: "روابط التواصل",
                          child: InkWell(
                            onTap: () {
                              // ممكن تفتح الرابط بالـ url_launcher
                            },
                            child: Text(
                              profile!['social_links'],
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),

                      // المهارات
                      if (profile!['skills'] != null)
                        _buildCard(
                          title: "مهاراتي",
                          child: Text(
                            profile!['skills'],
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),

                      // عدد الكتب
                      _buildCard(
                        title: "إحصائيات",
                        child: Row(
                          children: [
                            const Icon(Icons.book,
                                color: AppColors.secondary),
                            const SizedBox(width: 6),
                            Text(
                              "عدد الكتب المنشورة: ${profile!['published_books_count'] ?? 0}",
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // زر التعديل تحت
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.onPrimary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            if (profile == null) return;
                            final updated = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    EditProfilePage(profile: profile!),
                              ),
                            );
                            if (updated == true) {
                              _fetchProfile();
                            }
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text(
                            "تعديل الملف الشخصي",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
