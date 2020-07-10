//构造函数可以写多个
class Person {
  String name;
  num age;
  // 这是构造方法,类被实例话的时候会触发.默认的构造函数.和类名一样
  Person(name, age) {
    this.name = name;
    this.age = age;
  }

  // 命名构造函数
  // Person.now() {
  //   print('我是命名构造函数');
  // }

  void printInfo() {
    print('${this.name}----${this.age}');
  }

  void _run() {
    print('这是一个私有方法');
  }

  execRun() {
    this._run(); // 类里面方法的相互调用
  }
}
