# 在SQL Server中用好模糊查询指令LIKE (转载) - PowerCoder - 博客园
https://www.cnblogs.com/OpenCoder/p/9795701.html

like在sql中的使用：在SQL Server中用好模糊查询指令LIKE；  
查询是SQL Server中重要的功能，而在查询中将Like用上，可以搜索到一些意想不到的结果和效果，like的神奇

**一、一般搜索条件中用Like之处在于其提供的模糊查询功能，通过与它相匹配的四大类通配符，like放在条件中起到画龙点睛的作用。** 

* * *

可与LIKE配对的数据类型主要是字符串、日期或时间值。LIKE 关键字可以使用常规表达式包含上面三种类型数据，这些数据字符串中可包含下面四种通配符的任意组合。  
**通配符 含义**  
% 包含零个或更多字符的任意字符串。  
\_（下划线） 任何单个字符。  
\[ \] 指定范围（例如 \[a-f\]）或集合（例如 \[abcdef\]）内的任何单个字符。  
\[^\] 不在指定范围（例如 \[^a - f\]）或集合（例如 \[^abcdef\]）内的任何单个字符。

**请将通配符和字符串用单引号引起来**  
**例如：**   
LIKE '赵%' 将搜索姓赵的人名或者说以汉字‘赵’ 开头的字符串（如 赵刚、赵小刚等）。  
LIKE '%刚' 将搜索以汉字‘刚’结尾的所有字符串（如 刘刚、李小刚等）。  
LIKE '%小%' 将搜索在任何位置包含汉字‘小’的所有字符串（如赵小刚、李小刚、山本小郎等）。  
LIKE '\_小刚' 将搜索以汉字“小刚”结尾的所有三个汉字的名称（如 李小刚、赵小刚）。  
针对英文，情形更多，如  
LIKE '\[CK\]ars\[eo\]n' 将搜索下列字符串：Carsen、Karsen、Carson 和 Karson（如 Carson）。  
LIKE '\[M-Z\]inger' 将搜索以字符串 inger 结尾、以从 M 到 Z 的任何单个字母开头的所有名称（如 Ringer）。  
LIKE 'M\[^c\]%' 将搜索以字母 M 开头，并且第二个字母不是 c 的所有名称（如 MacFeather）。  
比如数据库pubs中有一个表author，它的电话号码一列即phone这一项，那么查找所有区号为 010 的电话号码命令为：

```sql
SELECT phone FROM pubs.dbo.authors WHERE   phone LIKE '010%';
```

可以用同样的通配符使用 NOT LIKE。若要在 authors 表中查找区号不是 010 的所有电话号码，请使用下列等价查询中的任意一个：

```sql
SELECT phone FROM pubs.dbo.authors WHERE   phone NOT LIKE '010%';
```

\-- 或者

```sql
SELECT phone FROM pubs.dbo.authors WHERE   NOT phone LIKE '010%';
```

IS NOT NULL 子句可与通配符和 LIKE 子句结合使用。例如，下列查询从 authors 表中检索以 010 开头且 IS NOT NULL 的所有电话号码：

SELECT phone FROM authors WHERE   phone LIKE '010%'
        AND phone IS NOT NULL;

重要包含 LIKE 关键字的语句的输出结果取决于安装过程中所选的排序次序。  
可用于 text 列的 WHERE 条件只有 LIKE、IS NULL 或 PATINDEX。  
不与 LIKE 一同使用的通配符将解释为常量而非模式，换言之，这些通配符仅代表其本身的值。下列查询试图查找到少由四个字符 010% 组成的电话号码。该查询并不会查找以 010 开头的电话号码。

```sql
SELECT phone FROM pubs.dbo.authors WHERE   phone \= '010%';
```

使用通配符时应着重考虑的另一个问题是对性能的影响。如果表达式以通配符开头，就不能使用索引。（就如同给定了姓名"%mith"而非"Smith"时，将无法知道应从电话簿的哪一页开始查找。）表达式中间或结尾处的通配符不妨碍使用索引，如同在电话簿中一样，如果姓名为"Samuel%"，则不论 Samuels 和 Samuelson 是否都在电话簿上，都应知道该从何处开始查找。

**二、Like特殊情况：搜索通配符字符**

* * *

上面的搜索可以针对普通的汉字或中文，那如果遇到上述四种通配符要被搜到时应该如何处理呢？首先需注意的是通配符字符可以搜索，并且有两种方法可指定平常用作通配符的字符：  
使用 ESCAPE 关键字定义转义符。在模式中，当转义符置于通配符之前时，该通配符就解释为普通字符。例如，要搜索在任意位置包含字符串 5% 的字符串，请使用：

```sql
WHERE ColumnA LIKE '%5/%%' ESCAPE '/'
```

在上述 LIKE 子句中，前导和结尾百分号 (%) 解释为通配符，而斜杠 (/) 之后的百分号解释为字符%。但是由于此时斜杠 (/)变为了转义符，所以如果要在字符串中真正搜索字符斜杠 (/)，那么就要使用两个斜杠 (/)，例如：

```sql
WHERE ColumnA LIKE '%//%' ESCAPE '/'
```

在方括号 (\[ \]) 中只包含通配符本身。要搜索破折号 (-) 而不是用它指定搜索范围，请将破折号指定为方括号内的第一个字符：

```sql
WHERE ColumnA LIKE '9\[-\]5'
```

下表显示了括在方括号内的通配符的用法。

符号 含义

LIKE '5\[%\]' 5%

LIKE '5%'  5 后跟 0 个或更多字符的字符串

LIKE '\[\_\]n' \_n

LIKE '\_n' an, in, on (and so on)

LIKE '\[a-cdf\]' a, b, c, d, or f

LIKE '\[-acdf\]' -, a, c, d, or f

LIKE '\[ \[ \]' \[

LIKE '\]' \]

如果使用 LIKE 进行字符串比较，模式字符串中的包括起始空格和/或尾随空格在内的所有字符都有意义。如果查询比较要求返回包含"abc "（abc 后有一个空格）的所有行，则不会返回列值为"abc"（abc 后没有空格）行。但是反过来，情况并非如此。可以忽略模式所要匹配的表达式中的末尾空格。如果查询比较要求返回包含"abc"（abc 后没有空格）的所有行，则将返回以"abc"开始且具有零个或多个末尾空格的所有行。

[原文链接](https://www.cnblogs.com/yx007/p/5688804.html)