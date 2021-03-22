import 'package:bloc_usecase_example/screen/detail/state/github_detail_uimodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_detail_state.freezed.dart';

@freezed
abstract class GithubDetailState with _$GithubDetailState {
  const factory GithubDetailState.initializing() = _Initializing;
  const factory GithubDetailState.error() = _Error;
  const factory GithubDetailState.loaded(GithubDetailUiModel uiMode) = _Loaded;
}
