import 'package:bloc_usecase_example/screen/overview/bloc/github_overview_uimodel.dart';
import 'package:bloc_usecase_example/screen/overview/widget/github_overview_item.dart';
import 'package:flutter/material.dart';

class GithubOverviewList extends StatelessWidget {
  final List<GithubOverviewUiModel> _uiModels;
  const GithubOverviewList(this._uiModels);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _uiModels.length,
      itemBuilder: (ctx, index) {
        return GithubOverviewItem(_uiModels[index]);
      },
    );
  }
}
