import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerBloc>(
      create: (BuildContext context) => CustomerBloc(),
      child: const customerProfile()
      );
  }
}
