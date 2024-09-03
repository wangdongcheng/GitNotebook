<style type="text/css">
    h1 { counter-reset: h2counter; }
    h2 { counter-reset: h3counter; }
    h3 { counter-reset: h4counter; }
    h4 { counter-reset: h5counter; }
    h5 { counter-reset: h6counter; }
    h6 { }
    h2:before {
      counter-increment: h2counter;
      content: counter(h2counter) ".\0000a0\0000a0";
    }
    h3:before {
      counter-increment: h3counter;
      content: counter(h2counter) "."
                counter(h3counter) ".\0000a0\0000a0";
    }
    h4:before {
      counter-increment: h4counter;
      content: counter(h2counter) "."
                counter(h3counter) "."
                counter(h4counter) ".\0000a0\0000a0";
    }
    h5:before {
      counter-increment: h5counter;
      content: counter(h2counter) "."
                counter(h3counter) "."
                counter(h4counter) "."
                counter(h5counter) ".\0000a0\0000a0";
    }
    h6:before {
      counter-increment: h6counter;
      content: counter(h2counter) "."
                counter(h3counter) "."
                counter(h4counter) "."
                counter(h5counter) "."
                counter(h6counter) ".\0000a0\0000a0";
    }
</style>

# AMC8 秋季班
## 等差数列
### 等差数列基础
#### 概念梳理
- 若干个数排成一列称为数列。数列中的每一个数称为一项。其中第一项称为**首项**，最后一项称为**末项**，数列中，项的个数称为**项数**；
- 从第二项开始，后项与其相邻的前项之差都相等的数列称为**等差数列**，后项与前项的差称为**公差**；
- 公式：
    - $项数=(末项-首项)\div 公差+1$；
    - $第几项=首项+(项数-1) \times 公差$；
    - $总和=(首项+末项) \times 项数 \div 2$。

#### 例题
1) 计算：$2+5+8+ \ldots +23+26+29$；
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
2) 计算：$(2+4+6+ \ldots +100) -(1+3+5+ \ldots +99)$；
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
3) 计算：$1000-9-99-8-98-7-97-6-96-5-95-4-94-3-93-2-91-1-1$；
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
4) （1988年真题19）What is the 100th number in arithmetic sequence: $1,5,9,13,17,21,25,\ldots$？  
等差数列$1,5,9,13,17,21,25,\ldots$第100项是？

$（{\it} n^{\circ}）$



