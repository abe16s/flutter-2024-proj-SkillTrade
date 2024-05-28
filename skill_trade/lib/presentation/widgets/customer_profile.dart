import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';
import 'package:skill_trade/riverpod/customer_provider.dart';




class customerProfile extends ConsumerStatefulWidget {
  const customerProfile({super.key});

  @override
  ConsumerState<customerProfile> createState() => _customerProfileState();
}

class _customerProfileState extends ConsumerState<customerProfile> {
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(customerNotifierProvider.notifier).fetchProfile();
    });
  }
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(customerNotifierProvider);
    return Container(
      padding: const EdgeInsets.only(top: 60),
      child: Center( 
        child: profileState.isLoading ? CircularProgressIndicator() :
        profileState.error != null ? Text('Error loading your profile!') :
        Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(height: 10),
                InfoLabel(label: "Name", data: profileState.customer!.fullName,),
                InfoLabel(label: "Email", data: profileState.customer!.email),
                InfoLabel(label: "Phone", data: profileState.customer!.phone),
              ],
            )

      )
            
        
    );
  }
}