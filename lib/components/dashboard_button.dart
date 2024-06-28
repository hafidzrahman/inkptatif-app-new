import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';


class DashboardButton extends ConsumerWidget {
  final String text;
  final int index;
  const DashboardButton({super.key, required this.text, required this.index});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(indexBottomNavBarNotifierProvider.notifier).setIndex(index);
      },
      child: Card(
        margin: const EdgeInsets.only(top: 16),
        elevation: 3,
        shape: const BeveledRectangleBorder(),
        color: const Color.fromARGB(255, 0, 189, 19),
        child: Stack(children: [
          const Positioned(
            bottom: -30,
            right: -5,
            width: 90,
            height: 90,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color.fromARGB(70, 2, 71, 5),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
