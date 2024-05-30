import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/domain/models/technician.dart';
import 'package:skill_trade/presentation/widgets/technician_card.dart';
import 'package:skill_trade/application/blocs/find_tecnician_bloc.dart';
import 'package:skill_trade/presentation/events/find_tecnician_event.dart';
import 'package:skill_trade/presentation/states/find_tecnician_state.dart';

class FindTechnician extends StatelessWidget {
  const FindTechnician({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TechniciansBloc>(context).add(LoadTechnicians());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search",
                          contentPadding: EdgeInsets.symmetric(vertical: 14.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: BlocBuilder<TechniciansBloc, TechniciansState>(
              builder: (context, state) {
                if (state is TechniciansLoading){
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TechniciansLoaded) {
                  final List<Technician> technicians = state.technicians;
                  return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: 0.55, // Aspect ratio (width / height)
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return TechnicianCard(technician: technicians[index],);
                  },
                  itemCount: technicians.length,
                  );
                } else if (state is TechniciansError) {
                  return Center(child: Text(state.error));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
