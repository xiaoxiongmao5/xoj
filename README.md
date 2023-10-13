# xoj
XOJ 在线判题系统-项目入口

## 服务划分

1. 后端服务 [xoj-backend: 8091](https://github.com/xiaoxiongmao5/xoj-backend) : 负责核心业务，数据库处理
2. 判题服务 [xoj-judge-service: 8092](https://github.com/xiaoxiongmao5/xoj-judge-service) : 负责校验结果的
3. 代码沙箱 [xoj-code-sandbox: 8093](https://github.com/xiaoxiongmao5/xoj-code-sandbox) : 负责编译执行代码的
4. 前端服务 [xoj-frontend: 8088](https://github.com/xiaoxiongmao5/xoj-frontend) : 负责提供用户操作界面

