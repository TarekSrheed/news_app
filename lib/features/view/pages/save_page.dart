import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_images.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_state.dart';
import 'package:news_app_flutter/features/view/bloc/save_with_bloc/save_bloc.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SaveBloc, SaveState>(builder: (context, state) {
        if (state is SuccessToSave) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Image.network(
                      width: 341,
                      height: 200,
                      state.news.urlToImage,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image);
                      },
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back, color: black),
                          BlocBuilder<SaveBloc, SaveState>(
                            builder: (context, saveState) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<SaveBloc>()
                                      .add(RemoveFromSavedItem());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Item Unsaved",
                                        selectionColor: primaryBlue,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                  child: Image.asset(
                                    save,
                                    color: orange,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.news.title,
                          style: titleSaveStyle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.news.publishedAt,
                          style: dateSaveStyle,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.news.description,
                          style: subTitleSaveStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return  Text(PROBLEM);
        } else {
          return Center(
            child: Text(
              ISSAVED,
              style: titleStyle,
            ),
          );
        }
      }),
    );
  }
}
