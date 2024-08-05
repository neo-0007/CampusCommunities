import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PdfPicker extends StatelessWidget {
  final Size screenSize;
  final Future Function() selectFile;
  final  PlatformFile? pickedFile;
  const PdfPicker({super.key, required this.screenSize, required this.selectFile, this.pickedFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          selectFile();
        },
        child: Container(
          height: 100,
          width: screenSize.width - 100,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
          child: (pickedFile == null)
              ? const Center(
                  child: Icon(Icons.note_add_rounded),
                )
              : Center(
                  child: Text(pickedFile!.name),
                ),
        ),
      ),
    );
  }
}
