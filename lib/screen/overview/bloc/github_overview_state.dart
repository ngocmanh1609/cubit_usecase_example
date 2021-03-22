import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_uimodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_overview_state.freezed.dart';

@freezed
abstract class GithubOverviewState with _$GithubOverviewState {
  const factory GithubOverviewState.initializing() = _Initializing;
  const factory GithubOverviewState.error() = _Error;
  const factory GithubOverviewState.data(List<GithubOverviewUiModel> uiModels) =
      _Data;
}
