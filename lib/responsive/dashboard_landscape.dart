import 'package:flutter/material.dart';
import 'package:inkptatif/components/dashboard_input_card.dart';
import 'package:inkptatif/components/dashboard_mhs_info_card.dart';

class DashboardLandscape extends StatelessWidget {
  const DashboardLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Expanded(child: DashboardInputCard()),
          const SizedBox(width: 16,),
          Expanded(child: DashboardMhsInfoCard(portrait : false)),
        ],
      );
  }
}
