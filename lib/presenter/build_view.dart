import 'package:flutter_application_1/data/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/news.dart';
import 'package:flutter_application_1/presenter/build_itemList.dart';
import 'package:flutter_application_1/view/widgets/dialog_button.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().Getdio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildItemList(
                            snapshotData: (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              print(news.tittle);
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('confirmation'),
                                  content: Text(
                                      'Are you sure to add this news to favorite list?'),
                                  actions: [
                                    DialogButton(
                                      text: 'NO',
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    DialogButton(
                                      text: 'YES',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Text("Ha ocurrido un error !!"),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
