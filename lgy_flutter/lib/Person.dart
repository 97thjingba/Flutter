// //构造函数可以写多个
// class Person {
//   String name;
//   num age;
//   // 这是构造方法,类被实例话的时候会触发.默认的构造函数.和类名一样
//   Person(name, age) {
//     this.name = name;
//     this.age = age;
//   }

//   // 命名构造函数
//   // Person.now() {
//   //   print('我是命名构造函数');
//   // }

//   void printInfo() {
//     print('${this.name}----${this.age}');
//   }

//   void _run() {
//     print('这是一个私有方法');
//   }

//   execRun() {
//     this._run(); // 类里面方法的相互调用
//   }
// }

// 实现一个简单的模型类.
// 为什么要实现？
// 当直接请求下来的数据通过手动序列化(json.decode())后,只能在我们运行以后才能
// 知道值的类型，通过这种方法，我们失去了大部分静态类型语言特性：类型安全，自动补全
// 和最重要的编译时异常。这样的话，代码就会变得非常容易出错。
class Person {
  final String id;
  final int amount;

  Person(this.id, this.amount);
  // 命名构造函数(同样可以完成对类实例的构造)
  // 初始化列表 是为了让List和Map的参数更好用，实例化之前对属性赋值
  // Person.fromJson(Map<String, dynamic> json)
  //     : amount = json['result']['amount'],
  //       id = json['result']['user_id'];
  Person.fromJson(Map<String, dynamic> json)
      : id = json['result']['user_id'],
        amount = json['result']['amount'];

  Map<String, dynamic> toJson() => {
        'name': amount,
        'id': id,
      };
}
