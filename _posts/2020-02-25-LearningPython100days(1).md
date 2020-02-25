---
title:  "[Python]自學 Python 100 天，基礎"
date:   2020-02-25 18:01:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---

# 前言
Pyhton100天系列文都是記錄自己學習 Python 的過程，並不是教學，所以可能有些部分會寫得不清楚。

如果哪裡看不懂或是有誤，歡迎在底下留言，或是丟訊息給我 :)

參考的內容來自 [Python - 100天从新手到大师](https://github.com/jackfrued/Python-100-Days)。

進度上的安排沒有根據作者的編排，但整個流程是跟著教材走，畢竟我就是個程式新手QQ

就開始吧！

# Day02 整理
## 變數(variable)的命名規則
Python 規定：
* 數字不為開頭。
* 大小寫敏感。
* 變數名稱不要跟關鍵字(例如 `if`)、系統保留自重疊(例如 `import`)。

PEP8 規則(程式設計師潛規則)：
* 變數以小寫字母拼寫；多個單字組成者以下底線連接，例如 `your_name`。
* 類別會以大寫為開頭，並採用駝峰命名法。
* 受保護的用一個下底線做開頭。
* 私有的用兩個下底線開頭。

## 運算符號

```python
a += b  # i.e: a = a + b
a *= b+2  # i.e: a = a*(b+2)
```

## 例題小注意

```python
input()  # 會回傳字串

# 正規輸出範例
print('面積 = %.2f cm^2' % (10.523))  # 顯示 10.52 cm^2
```

---

# Day03 整理
## 例題小注意

```python
list.remove(arg)  # remove()是刪除元素，而不是索引

# dictionary 變數
dict = { 'key1': value1, 'key2': value2}

# reduce 函數
# reduce 函數必須引入，即
from functools import reduce
reduce(lambda x, y: x+y, [1,2,3,4])
# 會執行 1+2+3+4
```
---

# Day04 整理
* 例題 4-3，打印 * 字金字塔，裡面的邏輯稍微注意一下吧！

```shell
  *           *         *
  **         **        ***
  ***       ***       *****
  ****     ****      *******
```

## 例題小注意

```python
# 於同一行 print，要多加參數 end='\t'，或是 end=' '
for x in range(1,4):
    print(x, end='\t')
# 會輸出 1 2 3
```

---

# Day06 整理
* 函數在 python 與其他程式語言的差異，例如 參數可以不按順序提供

```python
def add(a=0, b=0, c=0):
    return a + b + c

print(add(c=50, a=100, b=200))
```

## 函數可引入多個參數寫法

* 程式設計師，不一定知道使用者會傳遞多少參數給函數，此時可使用 `可變參數` 即常見的 `*args`。簡單的說，
* 若定義函數時，其參數前方加上 **1個** `*`，則使用函數時，提供的參數將會以 `list` 的方式儲存；
* 若參數前方式加上 **2個** `*` ，則提供的參數將以 `dict` 方式儲存。

```python
# 定義參數時，在參數前加上一個 *
# 以下範例表示輸入的參數 n 可以很多個，並以 list 儲存
def demo(*n):
    for i in n:    # 採用 list 的方式取值
        print(i)

demo(1, 2, 3) # 1 2 3


#------------------------------#

# 定義參數時，在參數前加上兩個 *
# 以下範例表示輸入的參數 n 可以很多個，並以 dict 儲存
def demo2(**n):
    for i in n:    
        print(n[i]) # 採用 dict 的方式取值

# 因為是以 dict 方式儲存，所以提供的參數要能夠轉成 dict
demo2(a=1, b=2, c=3) # 1 2 3
```

**其他函數範例：**

```python
# 在參數前面加上 *，則該參數就是一個可變參數
def add(*args):
    total = 0
    for val in args:  # 如此便不需要先設定輸入的參數個數
        total += val
    return total

# 透過可變參數，add函數便能引入更多參數
print(add())
print(add(1))
print(add(1, 2))
print(add(1, 2, 3))
print(add(1, 3, 5, 7, 9))  # Day06 一開始的範例中，定義的 add(a, b, c) 只能引入 3 個參數
```

* python 函數沒有多重載，因此**新定義的函數會覆蓋既有函數**。
* python 可透過模塊(module)來管理函數，以避免函數因為名稱相同而產生衝突，然而在引用模塊的時候仍有許多要注意的部分。
相關內容例如 `__name__ == '__main__'`，可參考[這篇文章](http://blog.castman.net/%E6%95%99%E5%AD%B8/2018/01/27/python-name-main.html)。
* 關於變數的作用範圍，例如全域變數、局部變數說明，可[參考這篇](https://openhome.cc/Gossip/Python/VariableScope.html)。

---

# Day07 整理
* 反斜線 `\` 後面可以接 **八進制** 或 **十六進制** 的數字來表示字元。
例如 `\141` 或 `\x61` 都表示小寫字母 `a`。
* 已知反斜線 `\` 會產生特殊字元，例如 `\n` 為跳脫字元、`\t` 為 tab 字元。若我們要取消反斜線造成的效果，可以在字串前加上 `r`，如下：

**範例一：**

```python
s1 = '\'hello, world!\''
s1_2 = r'\'hello, world!\''  # 字串前加上 r
print(s1, '\n', s1_2)
```
顯示為
```
'hello, world!'
 \'hello, world!\'
```

**範例二：**

```python
s2 = '\n\\hello, world!\\\n'
s2_2 = r'\n\\hello, world!\\\n'  # 字串前加上 r
print(s2, '\n', s2_2)
```
顯示為
```

\hello, world!\

 \n\\hello, world!\\\n
```

* 擷取 list 變數的部分元素

```python
str2 = 'abc123456'

print(str2[::2])   # ac246
print(str2[::-1])  # 654321cba
print(str2[-3:-1]) # 45
```
* 類似 Day04 例題，在 pyhton 中字串具有以下屬性可用

```python
str1 = 'center'

# 指定字串長度，字串放於中央，並於兩側加入指定字元
print(str1.center(10, '*'))
# 顯示為 '**center**'

# 指定字串長度，字串放於右側，並於左側加入指定字元
print(str1.rjust(10, '*'))
# 顯示為 '****center'
```

* `f字串` 使用方式如下

```python
a, b = 5, 10
print(f'{a}*{b} = {a*b}')
```

* 基本上，函數**不要影響**輸入的參數，如下：

```python
# 會影響參數
def ininA(list2):
    temp = list2  # 這邊 temp 是獲取到 list2 的記憶體位置?
    temp += ['a', 'b']
    return temp

# 不會影響參數
def ininB(list2):
    temp = list2.copy()  # 這邊 temp 是新的記憶體位置，該位置的值為 list2 值
    temp += ['a', 'b']
    return temp

aa = [1, 2, 3]
ininA(aa)  # [1, 2, 3, 'a', 'b']
print(aa)  # [1, 2, 3, 'a', 'b']

bb = [1, 2, 3]
ininB(bb)  # [1, 2, 3, 'a', 'b']
print(bb)  # [1, 2, 3]

```

* `tuple` 的好處在於**元素不可更動**，在前面提到**函數盡可能不要修改引入的參數**，這個時候參數的型態為 `tuple` 就很方便囉。減少資料被更動的機會就可大大提升程式碼的可維護性！