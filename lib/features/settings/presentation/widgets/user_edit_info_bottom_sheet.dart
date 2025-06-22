import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UserEditInfoBottomSheet extends StatefulWidget {
  final UserModel userModel;
  final TextEditingController usernameContoller;
  final TextEditingController bioContoller;
  final Function(String? imgPath) onSave;

  const UserEditInfoBottomSheet({
    super.key,
    required this.userModel,
    required this.usernameContoller,
    required this.bioContoller,
    required this.onSave,
  });

  @override
  State<UserEditInfoBottomSheet> createState() =>
      _UserEditInfoBottomSheetState();
}

class _UserEditInfoBottomSheetState extends State<UserEditInfoBottomSheet> {
  File? image;
  _setImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      setState(() {
        image = File(xFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 2.5,
                width: double.infinity,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 90),
              ),
              const SizedBox(height: 40),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _setImage();
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          image == null
                              ? NetworkImage(widget.userModel.userPhoto)
                              : FileImage(image!),
                      maxRadius: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => _setImage(),
                child: Text(
                  "Set new image",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: widget.usernameContoller,
                decoration: InputDecoration(
                  hintText: "Your username",
                  hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.4)),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: widget.bioContoller,
                decoration: InputDecoration(
                  hintText: "Your bio",
                  hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.4)),
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.usernameContoller.text.isNotEmpty) {
                        if (image != null) {
                          widget.onSave(image!.path);
                          context.pop();
                        } else {
                          widget.onSave(null);
                          context.pop();
                        }
                      } else {
                        ErrorDialog.showErrorDialog(
                          context: context,
                          error: "Username cannot be empty",
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                    ),
                    child: Text(
                      "Save",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
