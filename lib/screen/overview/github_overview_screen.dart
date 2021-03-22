import 'package:bloc_usecase_example/di/di.dart';
import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_model.dart';
import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_state.dart';
import 'package:bloc_usecase_example/screen/overview/widget/github_overview_list.dart';
import 'package:bloc_usecase_example/usecase/get_github_repositories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubOverviewScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider<GithubOverViewModel>(
      create: (_) => GithubOverViewModel(getIt<GetGithubRepositoriesUseCase>()),
      child: GithubOverviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Repositories"),
      ),
      body: BlocBuilder<GithubOverViewModel, GithubOverviewState>(
          builder: (ctx, state) {
        return state.when(
          initializing: () => const Center(child: CircularProgressIndicator()),
          error: () => const Center(child: Text("Error")),
          data: (uiModels) => GithubOverviewList(uiModels),
        );
      }),
    );
  }
}
