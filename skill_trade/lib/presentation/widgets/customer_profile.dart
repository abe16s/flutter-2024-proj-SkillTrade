import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';
import 'package:skill_trade/riverpod/customer_provider.dart';

class customerProfile extends ConsumerWidget {
  const customerProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final profile = ref.watch(customerProfileProvider);
    // return 
    return Container(
      padding: const EdgeInsets.only(top: 60),
      child: Center(
        child: profile.when(
        data: (profile) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(height: 10),
                InfoLabel(label: "Name", data: profile.fullName,),
                InfoLabel(label: "Email", data: profile.email),
                InfoLabel(label: "Phone", data: profile.phone),
              ],
            );},
          
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading bookings: $error')),
        ),
      ),
        
        
    );
  }
}