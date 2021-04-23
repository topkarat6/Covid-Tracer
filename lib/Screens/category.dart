import 'package:covid19_app/Models/ArticleModel.dart';
import 'package:covid19_app/Screens/News.dart';
import 'package:covid19_app/helper/Haberler.dart';
import 'package:flutter/material.dart';
import 'Articles_view.dart';

class CategoryNews extends StatefulWidget {
  final String categoryType;

  const CategoryNews({Key key, this.categoryType}) : super(key: key);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<articleModel> articles = [];
  bool _loading = true;
  News news = new News();
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    Categories ctnews = Categories();
    await ctnews.getCtegoryNews(widget.categoryType);
    articles = ctnews.haber;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaegoriler"),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].imageToUrl,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  const BlogTile({
    Key key,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Articleview(
                    BlogUrl: url,
                  )),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl)),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
