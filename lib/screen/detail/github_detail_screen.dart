import 'package:bloc_usecase_example/di/di.dart';
import 'package:bloc_usecase_example/screen/detail/state/github_detail_model.dart';
import 'package:bloc_usecase_example/screen/detail/state/github_detail_state.dart';
import 'package:bloc_usecase_example/screen/detail/widget/github_detail_body.dart';
import 'package:bloc_usecase_example/usecase/get_github_repository_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubDetailScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider<GithubDetailModel>(
      create: (_) => GithubDetailModel(getIt<GetGithubRepositoryUseCase>()),
      child: GithubDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final repoName = ModalRoute.of(context)?.settings.arguments as String;
    BlocProvider.of<GithubDetailModel>(context).init(repoName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: BlocBuilder<GithubDetailModel, GithubDetailState>(
        builder: (ctx, state) {
          return state.when(
            initializing: () =>
                const Center(child: CircularProgressIndicator()),
            error: () => const Center(child: Text("Error")),
            loaded: (uiModel) => GithubDetailBody(uiModel),
          );
        },
      ),
    );
  }
}
