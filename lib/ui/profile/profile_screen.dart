import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/auth/providers/auth_controller_provider.dart';
import 'package:tickets_app/ui/profile/provider/controller_profile_provider.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: Colors.grey.shade300, height: 1),
          ),
        ),
        backgroundColor: Colors.white,
        body: ErrorState('Something went wrong. Please try again later'),
      );
    }

    final profileState = ref.watch(profileControllerProvider(user.email!));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      backgroundColor: Colors.white,
      body:
          profileState.isLoading
              ? Loading()
              : profileState.errorMessage != null
              ? ErrorState(profileState.errorMessage!)
              : profileState.profile == null
              ? ErrorState('Something went wrong. Try again later')
              : SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: const NetworkImage(
                        'https://lh3.googleusercontent.com/a/ACg8ocKaAtVYDGLnqUdxtudN9p-VYaCT5iDkxwlTpIdcb1GKa6MWcF9F=s288-c-no',
                      ),
                      onBackgroundImageError: (_, __) {},
                    ),
                    const SizedBox(height: 16),
                    Text(
                      profileState.profile!.fullName,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profileState.profile!.username,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 32),

                    // Info Cards
                    _buildInfoCard(
                      icon: Icons.person_outline,
                      title: 'Email',
                      value: profileState.profile!.username,
                      context: context,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      icon: Icons.account_circle_outlined,
                      title: 'Full Name',
                      value: profileState.profile!.fullName,
                      context: context,
                    ),
                    const SizedBox(height: 32),

                    // Buttons
                    Row(
                      children: [
                        // Expanded(
                        //   child: ElevatedButton.icon(
                        //     icon: const Icon(Icons.lock_outline),
                        //     label: const Text('Change Password'),
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: primary,
                        //       foregroundColor: Colors.white,
                        //       padding: const EdgeInsets.symmetric(vertical: 14),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       developer.log('Change Password Pressed');
                        //     },
                        //   ),
                        // ),
                        // const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.logout),
                            label: const Text('Logout'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primary,
                              side: BorderSide(color: primary),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .logout();
                              context.push('/login');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required BuildContext context,
  }) {
    final primary = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Icon(icon, color: primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
