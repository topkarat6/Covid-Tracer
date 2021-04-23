import 'package:covid19_app/Models/categoriModel.dart';

 List<categoryModels> getCategories() {
    List<categoryModels> category = [];
    categoryModels categoryModel = new categoryModels();
//1
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Business";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
    categoryModel.SecondName = "İş";
    category.add(categoryModel);

    //2
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Entertainment";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    categoryModel.SecondName = "Eğlence";
    category.add(categoryModel);

    //3
    categoryModel = new categoryModels();
    categoryModel.categoryName = "General";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1614180402341-c541e499db97?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80";
    categoryModel.SecondName = "Genel";
    category.add(categoryModel);

    //4
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Health";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1605684954998-685c79d6a018?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
    categoryModel.SecondName = "Sağlık";
    category.add(categoryModel);

    //5
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Science";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1511174511562-5f7f18b874f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
    categoryModel.SecondName = "Bilim";
    category.add(categoryModel);

    //5
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Sports";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1599586120566-886c39306895?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
    categoryModel.SecondName = "Spor";
    category.add(categoryModel);

    //5
    categoryModel = new categoryModels();
    categoryModel.categoryName = "Technology";
    categoryModel.imageUrl =
        "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80";
    categoryModel.SecondName = "Teknoloji";
    category.add(categoryModel);

    return category;
  }