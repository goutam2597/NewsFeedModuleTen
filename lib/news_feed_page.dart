import 'package:flutter/material.dart';
import 'package:module_ten_news_feed/article_class.dart';

import 'article_list.dart';

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  Orientation _currentOrientation = Orientation.portrait;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _currentOrientation = MediaQuery.of(context).orientation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            _currentOrientation = orientation;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _currentOrientation == Orientation.portrait ? 1 : 2,
                childAspectRatio: 1.0,
              ),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(articles[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildArticleItem(Article article) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          article.thumbnailUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
