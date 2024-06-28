import 'package:flutter/material.dart';
import 'package:inkptatif/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';

class PenilaianInputItem extends ConsumerStatefulWidget {
  final String title;
  int nilai;
  PenilaianInputItem({super.key, required this.title, required this.nilai});

  @override
  ConsumerState<PenilaianInputItem> createState() => _PenilaianInputItemState();
}

class _PenilaianInputItemState extends ConsumerState<PenilaianInputItem> {
  int inputNilai = 0;

  @override
  void initState() {
    super.initState();
    inputNilai = widget.nilai;
  }

  TextEditingController _controller(int initialValue) {
    return TextEditingController(text: '$initialValue');
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressPlusButton() {
    setState(() {
      if (inputNilai >= 0 && inputNilai < 100) {
        inputNilai += 1;
        ref
            .read(storageNilaiProvider.notifier)
            .addData(widget.title, inputNilai);
      }
    });
  }

  void onPressMinusButton() {
    setState(() {
      if (inputNilai > 0 && inputNilai <= 100) {
        inputNilai -= 1;
        ref
            .read(storageNilaiProvider.notifier)
            .addData(widget.title, inputNilai);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: primary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: const Color.fromARGB(255, 216, 216, 216),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: secondary,
                  strokeAlign: .3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: TextButton(
                  onPressed: onPressMinusButton,
                  child: Text(
                    "-",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primary),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            SizedBox(
              width: 50,
              child: TextField(
                controller: _controller(inputNilai),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    int? temp = int.tryParse(value);
                    if (temp == null) {
                      inputNilai = 0;
                      ref.read(storageNilaiProvider.notifier).addData(widget.title, inputNilai);
                    } else if (temp > 0 && temp <= 100) {
                      inputNilai = int.tryParse(value) ?? 0;
                      ref.read(storageNilaiProvider.notifier).addData(widget.title, inputNilai);
                    } else if (inputNilai == 0 || temp == 0) {
                      inputNilai = int.tryParse(value[value.length - 1]) ?? 0;
                      ref.read(storageNilaiProvider.notifier).addData(widget.title, inputNilai);
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Card(
              color: const Color.fromARGB(255, 216, 216, 216),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: secondary,
                  strokeAlign: .3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: TextButton(
                  onPressed: onPressPlusButton,
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
