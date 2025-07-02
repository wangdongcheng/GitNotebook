# .gitignore 忽略文件和目录-腾讯云开发者社区-腾讯云
![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/02-07-2025,%2012-06-22/a6018a81-63ac-48a5-926c-ffcabb935644.jpeg?raw=true)

*   [1\. .gitignore 简介](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%231.%2520.gitignore%2520%25E7%25AE%2580%25E4%25BB%258B&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [2\. .gitignore 注释](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%232.%2520.gitignore%2520%25E6%25B3%25A8%25E9%2587%258A&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [3\. / 开头或结尾的忽略](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%233.%2520%2520%25E5%25BC%2580%25E5%25A4%25B4%25E6%2588%2596%25E7%25BB%2593%25E5%25B0%25BE%25E7%259A%2584%25E5%25BF%25BD%25E7%2595%25A5&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [4\. glob 模式匹配忽略](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%234.%2520glob%2520%25E6%25A8%25A1%25E5%25BC%258F%25E5%258C%25B9%25E9%2585%258D%25E5%25BF%25BD%25E7%2595%25A5&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [5\. .gitignore 全局忽略](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%235.%2520.gitignore%2520%25E5%2585%25A8%25E5%25B1%2580%25E5%25BF%25BD%25E7%2595%25A5&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [6\. 忽略已提交到远程仓库的内容](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%236.%2520%25E5%25BF%25BD%25E7%2595%25A5%25E5%25B7%25B2%25E6%258F%2590%25E4%25BA%25A4%25E5%2588%25B0%25E8%25BF%259C%25E7%25A8%258B%25E4%25BB%2593%25E5%25BA%2593%25E7%259A%2584%25E5%2586%2585%25E5%25AE%25B9&objectId=2207768&objectType=1&isNewArticle=undefined)
*   [7\. 使用各种框架下的忽略规则](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.10zhan.com%2F%237.%2520%25E4%25BD%25BF%25E7%2594%25A8%25E5%2590%2584%25E7%25A7%258D%25E6%25A1%2586%25E6%259E%25B6%25E4%25B8%258B%25E7%259A%2584%25E5%25BF%25BD%25E7%2595%25A5%25E8%25A7%2584%25E5%2588%2599&objectId=2207768&objectType=1&isNewArticle=undefined)

##### 1\. .gitignore 简介

.gitignore 文件的作用就是告诉 git 哪些文件不需要添加到版本管理中（定义忽略提交的文件）

.gitignore 文件用来忽略被指定的文件或文件夹的改动，被记录在.gitignore文件里的文件或文件夹，是无法被 git 跟踪到的，换句话说，被忽略的文件是不会被放入到远程仓库里的。

也就是说，如果文件已经存在于远程仓库中，是无法通过 .gitignore 文件来忽略的

[站长源码网](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fs.10zhan.com%2F&objectId=2207768&objectType=1&isNewArticle=undefined)

##### 2\. .gitignore 注释

* * *

所有空行或者以注释符号 ＃ 开头的行都会被 git 忽略

以井号(#)开头的行是注释，将被忽略，空行可用于提高文件的可读性并对相关的模式行进行分组

```
# 忽略编辑器配置目录
/.idea
/.vscode
```

##### 3\. / 开头或结尾的忽略

之前在某篇文章中看到这句话: 以斜杠 `/` 开头表示忽略的是目录

后来发现并不是这样的，它真正的作用是只忽略同级的内容，而不忽略下级目录中的内容

**结论: / 位于头部的作用是只忽略当前目录下的内容；放在尾部的作用是只忽略目录，而不忽略文件**

**头尾都没有 /**

```
# 忽略当前目录及下级目录中所有的 runtime
# runtime 文件或目录都会被忽略
runtime
```

**前面有 /**

```
# 只忽略当前目录中的 runtime 文件或目录
# 不忽略下级目录中的 runtime 文件或目录
/runtime
```

**后面有 /**

```
# 只忽略当前目录和下级目录中的 runtime 目录
# 不忽略当前目录和下级目录中的 runtime 文件
runtime/
```

**头尾都有 /**

```
# 只忽略当前目录中的 runtime 目录
/runtime/
```

##### 4\. glob 模式匹配忽略

在 .gitignore 文件中可以使用标准的 glob 模式匹配

以星号 `*` 通配多个字符

```
# 忽略 vendor 目录下的所有文件
/vendor
```

以问号 `?` 通配单个字符

```
# 忽略文件名称为一个字符, 后缀名为 php 的文件
?.php
```

以方括号 `[]` 包含单个字符的匹配列表

```
# 忽略 125.php、135.php文件
1[23]5.php
```

以叹号 `!` 表示不忽略(跟踪)匹配到的文件或目录

**【注意项】注意写法 要忽略的文件夹一定要结尾 `/*` ，否则不忽略规则将无法生效**

```
# 忽略vendor目录下的所有文件
/vendor
```

##### 5\. .gitignore 全局忽略

git 允许创建全局 .gitignore 文件，所有本地 git 仓库都将遵守全局的忽略规则。

该文件的名称和位置没有要求，只要在 git 配置文件中路径指定正确即可。

例如，将 `~/.gitignore_global` 设置为全局 git 忽略文件，可以执行以下操作:

```
# 创建文件
touch ~/.gitignore_global
# 将文件添加到 git 配置
git config --global core.excludesfile ~/.gitignore_global
```

##### 6\. 忽略已提交到远程仓库的内容

**删除暂存区中的文件或目录**

```
git rm --cached <file>
git rm -r --cached <folder>
```

**在 .gitignore 中添加忽略配置**

**推送到远程仓库**

```
git add .gitignore
git commit -m '忽略文件'
git push origin master
```

##### 7\. 使用各种框架下的忽略规则

忽略编辑器配置文件

忽略特殊文件

.DS\_Store 文件一般出现在 MacOS 中，是 Finder 用来存储文件夹的显示属性的，比如: 文件图标的摆放位置

ThinkPHP 5.0

```
/runtime
/vendor
/thinkphp
```

Uni-App 项目

本文参与 [腾讯云自媒体同步曝光计划](https://cloud.tencent.com/developer/support-plan)，分享自作者个人站点/博客。