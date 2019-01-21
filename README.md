在swift中混编使用AOP,发现hook不到swift类中的函数

### 发现问题
1. NSClassFromString获取的Class为nil
2. hook不到函数
3. 捕获不到函数的参数  
### 解决问题
1. swift使用NSClassFromString，需要项目名+.+className才能获取到Class
2. 给函数添加@objc关键字，才能被oc获取到
3. 给函数添加关键字，dynamic动态查找成员,才能获取到函数的参数

