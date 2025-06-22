import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/posts/domain/usecases/make_post_use_case.dart';
import 'package:frizter/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class MakePostScreen extends StatefulWidget {
  MakePostScreen({super.key});

  @override
  State<MakePostScreen> createState() => _MakePostScreenState();
}

class _MakePostScreenState extends State<MakePostScreen> {
  final _subjectController = TextEditingController();
  final _contentController = TextEditingController();
  _pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        image = File(img.path);
      });
    }
  }

  File? image;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {
            state.maybeWhen(
              failure:
                  (error) => ErrorDialog.showErrorDialog(
                    context: context,
                    error: error,
                  ),

              orElse: () {},
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back),
                      style: IconButton.styleFrom(
                        backgroundColor: theme.hintColor.withOpacity(0.09),
                      ),
                    ),
                    Text("Make Post", style: theme.textTheme.headlineMedium),
                    IconButton(
                      onPressed: () async {
                        if (_subjectController.text.isNotEmpty &&
                            _contentController.text.isNotEmpty) {
                          context.read<PostsBloc>().add(
                            PostsEvent.makePost(
                              params: PostParams(
                                title: _subjectController.text,
                                content: _contentController.text,
                                image: image?.path,
                              ),
                            ),
                          );

                          context.pop();
                        } else {
                          ErrorDialog.showErrorDialog(
                            context: context,
                            error: "Not all fields are filled",
                          );
                        }
                      },
                      icon: Icon(
                        Icons.done,
                        color: theme.colorScheme.onPrimary,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _subjectController,
                  style: theme.textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: "Enter a subject of your note...",
                    hintStyle: TextStyle(
                      fontSize: 19,
                      color: theme.hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _contentController,
                    style: theme.textTheme.bodyLarge,
                    maxLines: null,
                    maxLength: null,
                    decoration: InputDecoration(
                      hintText: "Enter your note...",

                      hintStyle: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.hintColor,
                      ),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),

              Divider(thickness: 0.3),
              Row(
                children: [
                  const SizedBox(width: 20),

                  Icon(
                    Icons.attachment_rounded,
                    color: theme.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Attachments",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              image != null
                  ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colorScheme.secondary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.file(image!),
                      ),
                      Positioned(
                        top: -15,
                        right: -15,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: IconButton(
                              iconSize: 23,
                              constraints: BoxConstraints(),
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  image = null;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  : InkWell(
                    onTap: () => _pickImage(),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 180,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.2),
                        border: Border.all(
                          color: theme.colorScheme.secondary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.image,
                              size: 50,
                              color: theme.primaryColor,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Pick image",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                          ],
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
