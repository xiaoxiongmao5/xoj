# xoj（在线判题系统）

[在线访问](http://101.132.169.210:8081/user/login)

## 项目介绍

一个编程题目评测系统。能够根据管理员预设的题目用例对用户提交的代码进行执行和评测。

* 在系统前端，管理员可以创建、管理题目；用户可以自由搜索题目、阅读题目、编写并提交代码。
* 在系统后端，根据管理员设定的题目测试用例在代码沙箱中对代码进行编译、运行、判断输出是否正确。（其中，代码沙箱可以作为独立服务，提供给其他开发者使用）。

## 项目架构设计

该项目由前端 + 后端组成，在后端系统中，根据功能职责，将系统划分为三个关键模块：

* 核心业务后端、校验结果的判题服务、负责编译执行代码的可复用代码沙箱。
* 各模块相互独立，通过 Dubbo-go + Nacos RPC远程调用 技术实现高效协作。


1. 后端服务 [xoj-backend](https://github.com/xiaoxiongmao5/xoj-backend) : 负责核心业务，数据库处理
2. 判题服务 [xoj-judge-service](https://github.com/xiaoxiongmao5/xoj-judge-service) : 负责校验结果的
3. 代码沙箱 [xoj-code-sandbox](https://github.com/xiaoxiongmao5/xoj-code-sandbox) : 负责编译执行代码的
4. 前端服务 [xoj-frontend](https://github.com/xiaoxiongmao5/xoj-frontend) : 负责提供用户操作界面

## 项目展示

### 题库 && 做题界面

![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/82819371-d332-4b10-aafc-eb795fe11242)
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/41de23b4-b020-4a40-b3aa-cf8f043ff36c)
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/5e52cc12-d585-4862-bc2e-ee098a8df6b0)

### 浏览题目提交 && 提交代码详情界面
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/11db8d5a-3a04-4f00-819d-38e662546b3a)
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/1278a4e0-4c67-4634-a4f4-1df74d9ddc15)

### 题目管理界面
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/ee6819fc-7641-4ba5-94a4-4f6a1ffebb34)
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/1b43e902-2ed3-4fe0-b28c-1f5789878635)

### 用户管理界面
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/b9d8ad60-e3fb-4d3f-b07b-199ddfab5880)
![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/b29f4a59-0d7e-47fc-b239-88ca4afeb0eb)


## 做题流程的时序图

![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/d2207197-325a-4ddf-b88d-e4454d5eece1)

## 技术栈

### 后端技术栈

* 主语言：Golang
* 框架：Beego
* 数据库：MySQL8.0、Redis
* 注册中心：Nacos
* 接口文档生成：swagger
* 代码沙箱：Docker
* 容器化部署：Dockerfile、Docker Compose

### 前端技术栈

* 开发框架：Vue3、Vuex 状态管理
* 脚手架：Vue-CLI
* 组件库：Arco Design
* 前端工程化：ESLint + Prettier + TypeScript
* 接口代码生成：OpenAPI
* Markdown 富文本编辑器
* Monaco Editor 代码编辑器
* 前端项目模版（通用布局、权限管理、状态管理、菜单生成）

## 快速上手

1. 单独部署【代码沙箱】服务：[部署文档](https://github.com/xiaoxiongmao5/xoj-code-sandbox/tree/main#readme)
2. 单独部署 nacos 服务
    ```bash
    cd docker-nacos
    docker compose up -d
    ```
    启动成功后，可以看到如下界面：
    ![image](https://github.com/xiaoxiongmao5/xoj/assets/25204083/33068608-ca00-4d65-9a6a-cad0cba9f100)
  
    可以去 nacos 注册中心看一下，访问 http://部署服务器的IP地址:8848/nacos/index.html
    默认用户名和密码都是 nacos

    补充：若报错 `! nacos Your kernel does not support swap limit capabilities or the cgroup is not mounted. Memory limited without swap.`
    原因：这个错误与Linux系统的swap分区配额限制有关。Nacos是一个服务发现和配置管理平台，它依赖于Linux的cgroup功能来管理资源和限制。
    解决：
    ```bash
    # 编辑 GRUB 配置文件
    sudo vim /etc/default/grub

    # 在 GRUB_CMDLINE_LINUX_DEFAULT 行中添加 cgroup_enable=memory swapaccount=1
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash cgroup_enable=memory swapaccount=1"

    # 保存并退出编辑器
    # 更新 GRUB 配置
    sudo update-grub

    # 重启系统
    sudo reboot
    ```
4. 部署本项目
   1. 克隆该项目到本地
       ```bash
       git clone https://github.com/xiaoxiongmao5/xoj.git
       ```
   3. 修改配置
       ```bash
       vim docker-xoj/docker-compose.yml
       ```
       修改 `xoj-judge-service.extra_hosts`，将 `xoj-code-sandbox.com` 域名解析的IP修改为你部署的服务器的IP
  
       ```bash
       vim docker-xoj/docker-xoj-backend/conf/dubbogo.yaml
       vim docker-xoj/docker-xoj-judge-service/conf/dubbogo.yaml
       ```
       修改以上两个文件的 `dubbo.registries.nacos.address`，将 `address` 修改为你部署的服务器的IP和端口号
   5. 启动本项目
       ```bash
       docker compose up -d
       ```

## 已完成的项目扩展 ⭐⭐

### 前端
1. 题库、浏览题目提交界面：对表格字段的标签、判题结果、内存、耗时、执行状态、题目列做更美观的展示：标签化、区分颜色显示
    * 点击题目列可跳转到做题界面
    * 修改通过率字段显式值：仅保留两位小数
    * 当执行状态为判题中时，判题结果显示为loading
2. 浏览题目提交页面：
    * 添加定时器自动刷新界面，保证获取到题目提交的最新状态
    * 增加查看代码的功能按钮，如果当前用户是题目提交者或者是管理员，就显式该按钮，点击后可以查看提交的代码和具体判题结果
6. 添加查看已提交题目详情界面，并显示代码编译执行异常时的详细输出内容，并且添加可继续做题的提交按钮
7. 做题成功后自动跳转到做浏览题目提交界面
8. 做题界面和查看已提交题目详情界面：
    * 添加根据编程语言区分的tag子标签页，来显式答案信息
    * 添加答案模版默认填充到代码编辑器中，切换语言后自动更新对应的答案模版
11. 管理题目和创建题目界面：添加答案模版的文本编辑框
12. 优化代码编辑组件 CodeEditor：允许从外部动态更新代码编辑器的内容；并在监听语言变动的时候，动态更新代码编辑器的内容
13. 添加用户管理界面、注册账号界面和退出登录功能

### 后端
1. 增加题目的通过数、提交数统计，计算通过率
2. 限制单个用户的提交频率，通过IP限流实现
3. 使用事务确保题目提交的完整性：添加题目到题目提交表、更新题目提交数+1、将提交题目ID放入消息队列
4. 添加功能API：获取提交题目的封装信息(仅当前用户是题目提交者或者是管理员才返回提交代码，否则返回空代码)
5. JudgeInfo结构体添加 Detail 字段，用于存储题目编译或运行时的具体报错信息
6. 添加使用交叉编译方式，解决在 Mac 下编译出 Linux 的 golang 执行文件
7. 题目表结构添加 AnswerTemplate 题目答案模版字段
8. 构建容器化部署方案，使用Docker、Docker Compose实现一键部署，提升应用部署效率

## 项目过程中的文章产出 📚

* [使用 OpenAPI Typescript Codegen 一键生成前端接口代码](https://blog.csdn.net/trinityleo5/article/details/133282852?spm=1001.2014.3001.5502)
* [深入理解 Beego ORM：原理与示例](https://blog.csdn.net/trinityleo5/article/details/133385516?spm=1001.2014.3001.5502)
* [[Go版]设计模式——Template模版方法模式](https://blog.csdn.net/trinityleo5/article/details/133589082?spm=1001.2014.3001.5502)
* [golang 在 Mac、Linux、Window 下交叉编译](https://blog.csdn.net/trinityleo5/article/details/133892935)

## 欢迎贡献

项目需要大家的支持，期待更多小伙伴的贡献，你可以：

* 对于项目中的Bug和优化建议，可以提issues，我会积极响应。
