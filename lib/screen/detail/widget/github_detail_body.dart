import 'package:bloc_usecase_example/screen/detail/state/github_detail_uimodel.dart';
import 'package:flutter/material.dart';

class GithubDetailBody extends StatelessWidget {
  final GithubDetailUiModel _uiModel;
  const GithubDetailBody(this._uiModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(_uiModel.ownerAvatar),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(_uiModel.repoName),
          ),
        ),
      ],
    );
  }
}
