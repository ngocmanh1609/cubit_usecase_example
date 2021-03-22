import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_state.dart';
import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_uimodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_usecase_example/usecase/get_github_repositories_usecase.dart';

class GithubOverViewModel extends Cubit<GithubOverviewState> {
  GetGithubRepositoriesUseCase _getGithubRepositoriesUseCase;
  GithubOverViewModel(this._getGithubRepositoriesUseCase)
      : super(const GithubOverviewState.initializing()) {
    _init();
  }

  void _init() {
    _getGithubRepositoriesUseCase.execute().then((responses) {
      List<GithubOverviewUiModel> uiModels = responses.map((response) {
        return GithubOverviewUiModel(
          id: response.id ?? -1,
          repoPath: response.fullName ?? "",
          repositoryName: response.name ?? "",
          repositoryDescription: response.description ?? "",
          ownerName: response.owner?.login ?? "",
          ownerAvatar: response.owner?.avatarUrl ?? "",
        );
      }).toList();
      emit(GithubOverviewState.data(uiModels));
    }, onError: (e) {
      emit(GithubOverviewState.error());
    });
  }
}
