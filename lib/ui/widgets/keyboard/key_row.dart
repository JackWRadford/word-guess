import 'package:flutter/material.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/ui/widgets/keyboard/key_tile.dart';

/// row of keys for keyboard
/// takes a list of charModels (chars and state)
class KeyRow extends StatelessWidget {
  final List<CharModel> rowData;
  const KeyRow({Key? key, required this.rowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: rowData.length,
        itemBuilder: (ctx, i) => KeyTile(
          char: rowData[i].char!,
          ctState: rowData[i].ctState,
        ),
      ),
    );
  }
}
