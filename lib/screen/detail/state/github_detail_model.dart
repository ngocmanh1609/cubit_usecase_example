import 'package:bloc_usecase_example/screen/detail/state/github_detail_state.dart';
import 'package:bloc_usecase_example/screen/detail/state/github_detail_uimodel.dart';
import 'package:bloc_usecase_example/usecase/get_github_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubDetailModel extends Cubit<GithubDetailState> {
  GetGithubRepositoryUseCase _getGithubRepositoryUseCase;

  GithubDetailModel(this._getGithubRepositoryUseCase)
      : super(const GithubDetailState.initializing());

  void init(String repoPath) {
    _getGithubRepositoryUseCase.execute(repoPath).then((response) {
      var uiModel = GithubDetailUiModel(
        response.fullName ?? "",
        response.owner?.avatarUrl ?? "",
      );
      emit(GithubDetailState.loaded(uiModel));
    }, onError: (e) {
      emit(GithubDetailState.error());
    });
  }
}
