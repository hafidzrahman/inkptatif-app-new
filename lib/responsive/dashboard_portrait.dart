import 'package:flutter/material.dart';
import 'package:inkptatif/components/dashboard_input_card.dart';
import 'package:inkptatif/components/dashboard_mhs_info_card.dart';

class DashboardPortrait extends StatelessWidget {
  const DashboardPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          const DashboardInputCard(),
          DashboardMhsInfoCard(portrait : true)
        ],
      );
  }
}
