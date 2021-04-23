import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19_app/Models/ArticleModel.dart';
import 'package:covid19_app/Models/categoriModel.dart';
import 'package:covid19_app/Screens/Articles_view.dart';
import 'package:covid19_app/Screens/category.dart';
import 'package:covid19_app/helper/Haberler.dart';
import 'package:covid19_app/helper/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@override
class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<categoryModels> categories = [];
  List<articleModel> articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    Haberler hb = Haberler();
    await hb.getNews();
    articles = hb.haber;
    if (mounted) {
      setState(() {
        setState(() {
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (context, int index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                secondName: categories[index].SecondName,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),
                    ),
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

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName, secondName;
  const CategoryTile(
      {Key key, this.imageUrl, this.categoryName, this.secondName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CategoryNews(
                    categoryType: categoryName.toLowerCase(),
                  )),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(right: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 140,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 140,
                height: 80,
                padding: EdgeInsets.all(10),
                color: Colors.black45,
                child: Center(
                  child: Text(
                    secondName,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
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
