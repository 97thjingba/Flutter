// import './Person.dart';
import 'package:flutter/material.dart';

import './HttpRequest.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import './Person.dart';
// class Rect {
//   num height;
//   num width;
//   // Rect(this.height, this.width);
//   // 下面的写法是在实例化之前进行动态赋值
//   Rect()
//       : height = 2,
//         width = 10 {
//     print('嘤嘤嘤');
//   }
//   get area {
//     return this.height * this.width;
//   }

//   set areaHeight(value) {
//     this.height = value;
//   }

/*
  Dart中的静态成员：
  1: 使用static关键字来实现类级别的变量和函数
  2: 静态方法不能访问非静态成员，非静态方法可以访问静态成员
  属性前面加static 就是静态属性
  方法面前加static 就是静态方法
  静态属性或者方法可以通过 类来直接访问.不用实例化
  类里面的非静态方法可以访问静态成员以及非静态成员
  类里面的静态方法只能访问静态成员 ****
  */

// }

// void main() {
// Map person  = {
//   "name": '张三',
//   "age": 20,
// };

// print(person.keys.toList());
// print(person.values.toList());
// remove 删除制定key的值
// addAll({}) 合并映射 给映射内增加属性
// containsValue 查看映射内的值 返回true/false

// List
// forEach
// map  返回的是一个集合 不是list
// where  返回的是一个集合 不是list  js里的filter
// any  返回的是一个集合 不是list  只要集合里面有一个满足条件的就返回true js里的some
// every  返回的是一个集合 不是list

// Rect r = new Rect();
// r.areaHeight = 32;   // set 方法
// print(r.area);

// 联缀操作
// Person p1 = new Person('333', 18);
// p1
//   ..name = "里斯"
//   ..age = 20
//   ..printInfo();

// Web w = new Web('dd', 23, 'e');
// w.printInfo();
// }

// 面向对象的三大特征: 封装, 继承，多态
/*
  Dart中的类的继承
    1:子类使用extends关键词来继承夫类
    2:子类会继承夫类里面可见的属性和方法 但是不会继承构造函数
    3:子类能复写夫类的方法 getter 和setter

  */

// class Web extends Person {
//   // 构造列表
//   String sex;
//   Web(name, age, String sex) : super(name, age) {
//     this.sex = sex;
//     super.execRun(); // 调用父类的方法
//   }

//   run() {
//     print('${this.name} --${this.sex}--${this.age}');
//   }

//   @override //可以写也可以不写。建议写上
//   void printInfo() {
//     print('44444444');
//   }
// }

/*
  Dard中抽象类：Dart抽象类主要用于定义标准，子类可以继承抽象类，也可以实现抽象类借口
  1:抽象类通过abstract 关键字来定义
  2:Dart中的抽象方法不能用abstract声明，Dart中没有方法体的方法称为抽象方法
  3:如果子类继承抽象类必须要实现里面的抽象方法
  4:如果把抽象类当作接口实现的话必须要实现抽象类里面定义的所有属性和方法
  5:抽象类不能被实例化，只有继承它的子类可以

extends 和 implements的区别：
  1: 如果要复用抽象类里面的方法，并且要用抽象方法约束子类的化我们就使用extends继承抽象类
  2: 如果只是把抽象类当作标准的化我们就用implements实现抽象类
*/

// abstract class Animal {
//   eat(); // 抽象方法 不去实现它的方法体就叫做抽象方法
//   run(); // 抽象方法 不去实现它的方法体就叫做抽象方法
//   printInfo() {
//     print('fdsfdsfsd');
//   }
// }

// class Dog extends Animal {
//   @override
//   eat() {
//     print('小狗吃');
//   }

//   @override
//   run() {
//     print('小狗跑');
//   }
// }

// main() {
//   Dog d = new Dog();
//   d.eat();
// }

/*
Dart中的多态
  允许将子类类型的指针赋值给父类类型的指针，同一个函数调用会有不同的执行效果。
  子类的实例赋值给夫类的引用。
  多态就是夫类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现。
*/

// abstract class Animal {
//   eat(); // 抽象方法 不去实现它的方法体就叫做抽象方法
//   printInfo() {
//     print('fdsfdsfsd');
//   }
// }

// class Dog extends Animal {
//   @override
//   eat() {
//     print('小狗吃');
//   }

//   run() {
//     print('跑');
//   }
// }

// class Cat extends Animal {
//   @override
//   eat() {
//     print('小猫吃');
//   }
// }

// main() {
//   Animal d = new Dog(); //子类的实例赋值给父类的引用;
//   d.eat(); // 这样d就只能含有eat()方法;
// }

/*
Dart的接口
  首先，dart的接口没有interface关键字，而是普通类或抽象类都可以作为接口被实现
  同样使用implements关键字进行实现
  但是dart的接口有点奇怪，如果实现的类是普通类，会将普通类和抽象中的属性的方法全部需要复写一遍
  而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像java接口那样的方式，一般会使用抽象类/
  建议使用抽象类定义接口。 

  // 定义一个DB库， 支持mysql mssql mongodb
  这三个类里面都有同样的方法
*/

// abstract class Db {
//   //当作接口 接口: 就是约定 规范
//   String uri;
//   add();
//   edit();
//   delete();
// }

// class Mysql implements Db {
//   @override
//   add() {
//     // TODO: implement add
//     print('这是mysql的数据库');
//   }

//   @override
//   delete() {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   edit() {
//     // TODO: implement edit
//     throw UnimplementedError();
//   }

//   @override
//   String uri;
// }

// class MsSql implements Db {
//   @override
//   add() {
//     // TODO: implement add
//     throw UnimplementedError();
//   }

//   @override
//   delete() {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   edit() {
//     // TODO: implement edit
//     throw UnimplementedError();
//   }

//   @override
//   String uri;
// }

// class MongoDb implements Db {
//   @override
//   String uri;

//   @override
//   add() {
//     // TODO: implement add
//     throw UnimplementedError();
//   }

//   @override
//   delete() {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   edit() {
//     // TODO: implement edit
//     throw UnimplementedError();
//   }
// }

// /*
// 1:mixins的类只能继承自object，不能继承其他类
// 2:作为mixins的类不能构造函数
// 3:一个类可以mixins多个mixins类
// 4:mixins绝不是继承，也不是接口，而是一种全新的特性
// class C with A,B{

// }
// */

// /*
//  泛型就是解决类 接口 方法的复用性， 以及对不特定数据类型的支持(类型校验)
// */

// T getData<T>(T value) {
//   return value;
// }

void main() {
  runApp(new Center(
    child: new Text(
      'hello, world!',
      textDirection: TextDirection.ltr,
    ),
  ));
}
