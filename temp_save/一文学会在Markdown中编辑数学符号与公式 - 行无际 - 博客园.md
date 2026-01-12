# 一文学会在Markdown中编辑数学符号与公式 - 行无际 - 博客园
https://www.cnblogs.com/bytesfly/p/markdown-formula.html

在用Markdown写博客时会涉及到数学符号与公式的编辑，下面进行汇总。随手记录，方便你我他。

*   行内公式：将公式插入到本行内

```null
$0.98^{365} \approx 0.0006$

```

我的365天：0.98365≈0.0006

*   单独的公式块：将公式插入到新的一行内，并且居中

```null
$$
1.02^{365} \approx 1377.4
$$

```

在座各位大佬的365天：

1.02365≈1377.4

注意：

1.  在博客园用Markdown写博客需要启用数学公式支持，如下：

[![](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210819163846076-1128461557.png)
](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210819163846076-1128461557.png)

2.  在博客园可以在公式上右键查看详情：
    
    [![](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210822134624501-390959711.png)
    ](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210822134624501-390959711.png)
    
3.  如果使用Typora编写Markdown，解析行内公式需要手动设置一下， 文件 -> 偏好设置 -> Markdown -> Markdown扩展语法 -> 勾选 “内联公式”，重启软件，Typora才会解析行内公式。
    

[![](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210819164501658-996062202.png)
](https://img2020.cnblogs.com/blog/1546632/202108/1546632-20210819164501658-996062202.png)

符号[#](#符号)
----------

### 上下标、运算符[#](#上下标运算符)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| 上标 | x2、xy、e365 | `x^2、 x^y 、e^{365}` |
| 下标 | x0、a1、Ya | `x_0、a_1、Y_a` |
| 分式 | xy、1x+1 | `\frac{x}{y}、\frac{1}{x+1}` |
| 乘 | × | `\times` |
| 除 | ÷ | `\div` |
| 加减 | ± | `\pm` |
| 减加 | ∓ | `\mp` |
| 求和 | ∑ | `\sum` |
| 求和上下标 | ∑03、∑0∞、∑−∞∞ | `\sum_0^3 、\sum_0^{\infty} 、\sum_{-\infty}^{\infty}` |
| 求积 | ∏ | `\prod` |
| 微分 | ∂ | `\partial` |
| 积分 | ∫、∫ | `\int 、\displaystyle\int` |
| 不等于 | ≠ | `\neq` |
| 大于等于 | ≥ | `\geq` |
| 小于等于 | ≤ | `\leq` |
| 约等于 | ≈ | `\approx` |
| 不大于等于 | x+y≱z | `x+y \ngeq z` |
| 点乘 | a⋅b | `a \cdot b` |
| 星乘 | a∗b | `a \ast b` |
| 取整函数 | ⌊ab⌋ | `\left \lfloor \frac{a}{b} \right \rfloor` |
| 取顶函数 | ⌈cd⌉ | `\left \lceil \frac{c}{d} \right \rceil` |

### 括号[#](#括号)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| 圆括号（小括号） | (ab) | `\left( \frac{a}{b} \right)` |
| 方括号（中括号） | \[ab\]或者\[xy\] | `\left[ \frac{a}{b} \right]`或者`[ \frac{x}{y} ]` |
| 花括号（大括号） | {ab} | `\lbrace \frac{a}{b} \rbrace` |
| 角括号 | ⟨ab⟩ | `\left \langle \frac{a}{b} \right \rangle` |
| 混合括号 | \[a,b) | `\left [ a,b \right )` |

### 三角函数、指数、对数[#](#三角函数指数对数)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| sin | sin⁡(x) | `\sin(x)` |
| cos | cos⁡(x) | `\cos(x)` |
| tan | tan⁡(x) | `\tan(x)` |
| cot | cot⁡(x) | `\cot(x)` |
| log | log2⁡10 | `\log_2 10` |
| lg | lg⁡100 | `\lg 100` |
| ln | ln⁡2 | `\ln2` |

### 数学符号[#](#数学符号)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| 无穷 | ∞ | `\infty` |
| 矢量 | a→ | `\vec{a}` |
| 一阶导数 | x˙ | `\dot{x}` |
| 二阶导数 | x¨ | `\ddot{x}` |
| 算数平均值 | a¯ | `\bar{a}` |
| 概率分布 | a^ | `\hat{a}` |
| 虚数i、j | ı、ȷ | `\imath、\jmath` |
| 省略号(一) | 1,2,3,…,n | `1,2,3,\ldots,n` |
| 省略号(二) | x1+x2+⋯+xn | `x_1 + x_2 + \cdots + x_n` |
| 省略号(三) | ⋮ | `\vdots` |
| 省略号(四) | ⋱ | `\ddots` |
| 斜线与反斜线 | /ab\\ | `\left / \frac{a}{b} \right \backslash` |
| 上下箭头 | ↑ab↓ | `\left \uparrow \frac{a}{b} \right \downarrow` |
| ∠ | ∠ | `\angle` |
| ′ | ′ | `\prime` |
| → | → | `\rightarrow` |
| ← | ← | `\leftarrow` |
| ⇒ | ⇒ | `\Rightarrow` |
| ⇐ | ⇐ | `\Leftarrow` |
| ⇑ | ⇑ | `\Uparrow` |
| ⇓ | ⇓ | `\Downarrow` |
| ⟶ | ⟶ | `\longrightarrow` |
| ⟵ | ⟵ | `\longleftarrow` |
| ⟹ | ⟹ | `\Longrightarrow` |
| ⟸ | ⟸ | `\Longleftarrow` |
| ∇ | ∇ | `\nabla` |
| ∵ | ∵ | `\because` |
| ∴ | ∴ | `\therefore` |
| ∣ | ∣ | `\mid` |
| ∖ | ∖ | `\backslash` |
| ∀ | ∀ | `\forall` |
| ∃ | ∃ | `\exists` |
| ∽ | ∽ | `\backsim` |
| ≅ | ≅ | `\cong` |
| ∮ | ∮ | `\oint` |
| ⟹ | ⟹ | `\implies` |
| ⟺ | ⟺ | `\iff` |
| ⟸ | ⟸ | `\impliedby` |

### 连线符号[#](#连线符号)

| 显示效果 | markdown公式语法 |
| --- | --- |
| a+b+c← | `\overleftarrow{a+b+c}` |
| a+b+c→ | `\overrightarrow{a+b+c}` |
| a+b+c↔ | `\overleftrightarrow{a+b+c}` |
| a+b+c← | `\underleftarrow{a+b+c}` |
| a+b+c→ | `\underrightarrow{a+b+c}` |
| a+b+c↔ | `\underleftrightarrow{a+b+c}` |
| a+b+c¯ | `\overline{a+b+c}` |
| a+b+c\_ | `\underline{a+b+c}` |
| a+b+c⏞Sample | `\overbrace{a+b+c}^{Sample}` |
| a+b+c⏟Sample | `\underbrace{a+b+c}_{Sample}` |
| a+b+c⏟1.0⏞2.0 | `\overbrace{a+\underbrace{b+c}_{1.0}}^{2.0}` |
| a⋅a⋯a⏟b times | `\underbrace{a\cdot a\cdots a}_{b\text{ times}}` |

### 高级运算符[#](#高级运算符)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| 平均数运算 | xyz¯ | `\overline{xyz}` |
| 开二次方运算 | xy | `\sqrt {xy}` |
| 开方运算 | xn | `\sqrt[n]{x}` |
| 极限运算(一) | limy→0x→∞xy | `\lim^{x \to \infty}_{y \to 0}{\frac{x}{y}}` |
| 极限运算(二) | limy→0x→∞xy | `\displaystyle \lim^{x \to \infty}_{y \to 0}{\frac{x}{y}}` |
| 求和运算(一) | ∑y→0x→∞xy | `\sum^{x \to \infty}_{y \to 0}{\frac{x}{y}}` |
| 求和运算(二) | ∑y→0x→∞xy | `\displaystyle \sum^{x \to \infty}_{y \to 0}{\frac{x}{y}}` |
| 积分运算(一) | ∫0∞xdx | `\int^{\infty}_{0}{xdx}` |
| 积分运算(二) | ∫0∞xdx | `\displaystyle \int^{\infty}_{0}{xdx}` |
| 微分运算 | ∂x∂y、∂2x∂y2 | `\frac{\partial x}{\partial y}、\frac{\partial^2x}{\partial y^2}` |

### 集合运算[#](#集合运算)

|  | 显示效果 | markdown公式语法 |
| --- | --- | --- |
| 属于 | A∈B | `A \in B` |
| 不属于 | A∉B | `A \notin B` |
| 子集 | x⊂y、y⊃x | `x \subset y、y \supset x` |
| 真子集 | x⊆y、y⊇x | `x \subseteq y、y \supseteq x` |
| 并集 | A∪B | `A \cup B` |
| 交集 | A∩B | `A \cap B` |
| 差集 | A∖B | `A \setminus B` |
| 同或 | A⨀B | `A \bigodot B` |
| 同与 | A⨂B | `A \bigotimes B` |
| 异或 | A⨁B | `A \bigoplus B` |
| 实数集合 | R | `\mathbb{R}` |
| 自然数集合 | Z | `\mathbb{Z}` |

### 希腊字母[#](#希腊字母)

| 大写字母 | markdown语法 | 小写字母 | markdown语法 | 中文注音 |
| --- | --- | --- | --- | --- |
| A | `A` | α | `\alpha` | 阿尔法 |
| B | `B` | β | `\beta` | 贝塔 |
| Γ | `\Gamma` | γ | `\gamma` | 伽马 |
| Δ | `\Delta` | δ | `\delta` | 德尔塔 |
| E | `E` | ϵ | `\epsilon` | 伊普西龙 |
| Z | `Z` | ζ | `\zeta` | 截塔 |
| H | `H` | η | `\eta` | 艾塔 |
| Θ | `\Theta` | θ | `\theta` | 西塔 |
| I | `I` | ι | `\iota` | 约塔 |
| K | `K` | κ | `\kappa` | 卡帕 |
| Λ | `\Lambda` | λ | `\lambda` | 兰布达 |
| M | `M` | μ | `\mu` | 缪 |
| N | `N` | ν | `\nu` | 纽 |
| Ξ | `\Xi` | ξ | `\xi` | 克西 |
| O | `O` | ο | `\omicron` | 奥密克戎 |
| Π | `\Pi` | π | `\pi` | 派 |
| P | `P` | ρ | `\rho` | 肉 |
| Σ | `\Sigma` | σ | `\sigma` | 西格马 |
| T | `T` | τ | `\tau` | 套 |
| Υ | `\Upsilon` | υ | `\upsilon` | 宇普西龙 |
| Φ | `\Phi` | ϕ | `\phi` | 佛爱 |
| X | `X` | χ | `\chi` | 西 |
| Ψ | `\Psi` | ψ | `\psi` | 普西 |
| Ω | `\Omega` | ω | `\omega` | 欧米伽 |

### 字体转换[#](#字体转换)

若要对公式的某一部分字符进行字体转换，可以用 `{\font {需转换的部分字符}}` 命令，其中`\font`部分可以参照下表选择合适的字体。一般情况下，公式默认为意大利体。

| 字体 | 显示效果 | markdown语法 |
| --- | --- | --- |
| 罗马体 | D | `\rm D` |
| 花体 | D | `\cal D` |
| 意大利体 | D | `\it D` |
| 黑板粗体 | D | `\Bbb D` |
| 粗体 | D | `\bf D` |
| 数学斜体 | D | `\mit D` |
| 等线体 | D | `\sf D` |
| 手写体 | D | `\scr D` |
| 打字机体 | D | `\tt D` |
| 旧德式字体 | D | `\frak D` |
| 黑体 | D | `\boldsymbol D` |

公式[#](#公式)
----------

### 基本函数公式[#](#基本函数公式)

*   行内公式：Γ(z)\=∫0∞tz−1e−tdt

```null
$\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt$

```

*   行间公式：

Γ(z)\=∫0∞tz−1e−tdt

```null
$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt
$$

```

*   yk\=φ(uk+vk)

```null
$y_k=\varphi(u_k+v_k)$

```

*   y(x)\=x3+2x2+x+1

```null
$y(x)=x^3+2x^2+x+1$

```

*   xy\=(1+ex)−2xy

```null
$x^{y}=(1+{\rm e}^x)^{-2xy}$

```

*   f(n)\=∑i\=1nn∗(n+1)

```null
$\displaystyle f(n)=\sum_{i=1}^{n}{n*(n+1)}$

```

### 分段函数[#](#分段函数)

*   分段函数：

y\={2x+1,x≤0x,x\>0

```null
$$
y=\begin{cases}
2x+1, & x \leq0\\
x, & x>0
\end{cases}
$$

```

*   方程组：

{a1x+b1y+c1z\=d1a2x+b2y+c2z\=d2a3x+b3y+c3z\=d3

```null
$$
\left \{ 
\begin{array}{c}
a_1x+b_1y+c_1z=d_1 \\ 
a_2x+b_2y+c_2z=d_2 \\ 
a_3x+b_3y+c_3z=d_3
\end{array}
\right.
$$

```

### 积分[#](#积分)

*   积分书写：

∫θ1(x)θ2(x)\=l

```null
$$
\int_{\theta_1(x)}^{\theta_2(x)}=l
$$

```

*   二重积分：

∬dxdy\=σ

```null
$$
\iint dx dy=\sigma
$$

```

*   三重积分：

∭dxdydz\=ν

```null
$$
\iiint dx dydz=\nu
$$

```

### 微分和偏微分[#](#微分和偏微分)

*   一阶微分方程：

dydx+P(x)y\=Q(x)

```null
$$
\frac{dy}{dx}+P(x)y=Q(x)
$$

```

dydx|x\=0\=3x+1\=1

```null
$$
\left. \frac{\rm d y}{\rm d x} \right|_{x=0}=3x+1=1
$$

```

*   二阶微分方程：

y″+py′+qy\=f(x)

```null
$$
y''+py'+qy=f(x)
$$

```

d2ydx2+pdydx+qy\=f(x)

```null
$$
\frac{d^2y}{dx^2}+p\frac{dy}{dx}+qy=f(x)
$$

```

*   偏微分方程：

∂u∂t\=h2(∂2u∂x2+∂2u∂y2+∂2u∂z2)

```null
$$
\frac{\partial u}{\partial t}= h^2 \left( \frac{\partial^2 u}{\partial x^2} +\frac{\partial^2 u}{\partial y^2}+ \frac{\partial^2 u}{\partial z^2}\right)
$$

```

### 矩阵和行列式[#](#矩阵和行列式)

起始标记 `\begin{matrix}` ,结束标记`\end{matrix}`,每一行末尾标记\\，行间元素之间以&分隔。在起始、结束标记处用下列词替换`matrix`。

*   `pmatrix` ：小括号边框

(1234)

```null
$$
\begin{pmatrix}
1&2\\
3&4\\
\end{pmatrix}
$$

```

*   `bmatrix` ：中括号边框

\[1234\]

```null
$$
\begin{bmatrix}
1&2\\
3&4\\
\end{bmatrix}
$$

```

*   `Bmatrix` ：大括号边框

{1234}

```null
$$
\begin{Bmatrix}
1&2\\
3&4\\
\end{Bmatrix}
$$

```

*   `vmatrix` ：单竖线边框

|1234|

```null
$$
\begin{vmatrix}
1&2\\
3&4\\
\end{vmatrix}
$$

```

*   `Vmatrix` ：双竖线边框

‖1234‖

```null
$$
\begin{Vmatrix}
1&2\\
3&4\\
\end{Vmatrix}
$$

```

*   无框矩阵：

1xx21yy21zz2

```null
$$
\begin{matrix}
    1 & x & x^2 \\
    1 & y & y^2 \\
    1 & z & z^2 \\
\end{matrix}
$$

```

*   单位矩阵：

\[100010001\]

```null
$$
\begin{bmatrix}
1&0&0\\
0&1&0\\
0&0&1\\
\end{bmatrix}
$$

```

*   m×n矩阵：

A\=\[a11a12⋯a1na21a22⋯a2n⋮⋮⋱⋮am1am2⋯amn\]

```null
$$
A=\begin{bmatrix}
{a_{11}}&{a_{12}}&{\cdots}&{a_{1n}}\\
{a_{21}}&{a_{22}}&{\cdots}&{a_{2n}}\\
{\vdots}&{\vdots}&{\ddots}&{\vdots}\\
{a_{m1}}&{a_{m2}}&{\cdots}&{a_{mn}}\\
\end{bmatrix}
$$

```

*   行列式：

D\=|a11a12⋯a1na21a22⋯a2n⋮⋮⋱⋮am1am2⋯amn|

```null
$$
D=\begin{vmatrix}
{a_{11}}&{a_{12}}&{\cdots}&{a_{1n}}\\
{a_{21}}&{a_{22}}&{\cdots}&{a_{2n}}\\
{\vdots}&{\vdots}&{\ddots}&{\vdots}\\
{a_{m1}}&{a_{m2}}&{\cdots}&{a_{mn}}\\
\end{vmatrix}
$$

```

*   表格：

abcR1cbaR2bcc

```null
$$
\begin{array}{c|lll}
{}&{a}&{b}&{c}\\
\hline
{R_1}&{c}&{b}&{a}\\
{R_2}&{b}&{c}&{c}\\
\end{array}
$$

```

*   增广矩阵：

\[123456\]

```null
$$
\left[  \begin{array}  {c c | c} 
1 & 2 & 3 \\
4 & 5 & 6 \\
\end{array}  \right]
$$

```

案例[#](#案例)
----------

*   `^`表示上标, `_` 表示下标。如果上下标的内容多于一个字符，需要用`{}`将这些内容括成一个整体。上下标可以嵌套，也可以同时使用。

xyz\=(1+ex)−2xyw

```null
$$
x^{y^z}=(1+{\rm e}^x)^{-2xy^w}
$$

```

其中`\rm`表示字体转换，上面有过具体说明。

*   `()`、`[]`和`|`表示符号本身，使用 `\{` `\}` 来表示 {}。当要显示大号的括号或分隔符时，要用 `\left` 和 `\right` 命令。

f(x,y,z)\=3y2z(3+7x+51+y2)

```null
$$
f(x,y,z) = 3y^2z \left( 3+\frac{7x+5}{1+y^2} \right)
$$

```

*   行标的使用：在公式末尾前使用`\tag{行标}`来实现行标。

(公式1)f(\[1+{x,y}(xy+yx)(u+1)+a\]3/2)

```null
$$
f\left(
   \left[ 
     \frac{
       1+\left\{x,y\right\}
     }{
       \left(
          \frac{x}{y}+\frac{y}{x}
       \right)
       \left(u+1\right)
     }+a
   \right]^{3/2}
\right)
\tag{公式1}
$$

```

*   有时要用 `\left.` 或 `\right.` 进行匹配而不显示本身。

dudx|x\=0

```null
$$
\left. \frac{{\rm d}u}{{\rm d}x} \right| _{x=0}
$$

```

*   添加注释文字 `\text`

f(n)\={n/2,if n is even3n+1,if n is odd

```null
$$
f(n)= \begin{cases}
n/2, & \text {if $n$ is even} \\
3n+1, & \text{if $n$ is odd} \\
\end{cases}
$$

```

*   整齐且居中的方程式序列

(1)37\=732−1122(2)\=732122⋅732−1732(3)\=732122732−1732(4)\=73121−1732(5)≈7312(1−12⋅732)

```null
$$
\begin{align}
    \sqrt{37} & = \sqrt{\frac{73^2-1}{12^2}} \\
              & = \sqrt{\frac{73^2}{12^2}\cdot\frac{73^2-1}{73^2}} \\ 
              & = \sqrt{\frac{73^2}{12^2}}\sqrt{\frac{73^2-1}{73^2}} \\
              & = \frac{73}{12}\sqrt{1-\frac{1}{73^2}} \\ 
              & \approx \frac{73}{12}\left(1-\frac{1}{2\cdot73^2}\right) \\
\end{align}
$$

```

*   在一个方程式序列的每一行中注明原因

(1)v+w\=0Given(2)−w\=−w+0additive identity(6)−w+0\=−w+(v+w)equations (1) and (2)

```null
$$
\begin{align}
    v + w & = 0  & \text{Given} \tag 1 \\
       -w & = -w + 0 & \text{additive identity} \tag 2 \\
   -w + 0 & = -w + (v + w) & \text{equations $(1)$ and $(2)$} \\
\end{align}
$$

```

*   文字在左对齐显示

if n is even:n/2if n is odd:3n+1}\=f(n)

```null
$$
    \left.
        \begin{array}{l}
            \text{if $n$ is even:} & n/2 \\
            \text{if $n$ is odd:} & 3n+1 \\
        \end{array}
    \right\}
    =f(n)
$$

```

*   连分式

x\=a0+12a1+22a2+32a3+44a4+⋯

```null
$$
x = a_0 + \cfrac{1^2}{a_1 +
            \cfrac{2^2}{a_2 +
              \cfrac{3^2}{a_3 +
                \cfrac{4^4}{a_4 + 
                  \cdots
                }
              }
            }
          }
$$

```

*   表格

通常，一个格式化后的表格比单纯的文字或排版后的文字更具有可读性。  
数组和表格均以 `\begin{array}` 开头，并在其后定义列数及每一列的文本对齐属性，`c l r` 分别代表居中、左对齐及右对齐。若需要插入垂直分割线，在定义式中插入 `|` ，若要插入水平分割线，在下一行输入前插入 `\hline` 。  
与矩阵相似，每行元素间均须要插入 `&` ，每行元素以 \\ 结尾，最后以 `\ end{array}` 结束数组。

n左对齐居中对齐右对齐10.2411252−1189−83−2020001+10i

```null
$$
\begin{array}{c|lcr}
    n & \text{左对齐} & \text{居中对齐} & \text{右对齐} \\
    \hline
    1 & 0.24 & 1 & 125 \\
    2 & -1 & 189 & -8 \\
    3 & -20 & 2000 & 1+10i \\
\end{array}
$$

```