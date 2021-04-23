import 'package:covid19_app/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBlog extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
   TextEditingController t3 = TextEditingController();
  String author, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[900]),
                  child: Center(
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey[500],
                      size: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
               
                width: 380,
                child: textField2(
                  icon: Icons.arrow_forward_ios,
                  hint: "author...",
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  istrue: false,
                  textEdit: t1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 380,
                child: textField2(
                  icon: Icons.arrow_forward_ios,
                  hint: "title...",
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  istrue: false,
                  textEdit: t2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: 380,
                child: textField2(
                  icon: Icons.arrow_forward_ios,
                  hint: "description...",
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  istrue: false,
                  textEdit: t3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
