---
title:  "[Python]自學 Python 100 天，全域變數、區域變數(global、nonlocal)"
date:   2020-03-15 21:24:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---

# 前言
之前只知道有 `global` 不知道有 `nonlocal`，這便先簡單說明，當一個變數要使用到關鍵字 *global* 時，此變數本身為 **全域變數**，在**函數外先被定義**；

當變數使用到關鍵字 *nonlocal* 時，該變數為**局部變數**，為**函數內定義的變數**。

某函數要修改全域變數，則要使用關鍵字 *global*。
某函數要修改**上一層函數定義的局部變數**，要用 *nonlocal*。

# global範例

## global範例 - 定義全域變數
```python
# 定義全域變數
GA = 77

def fun1():
    print('全域變數可直接獲取:', GA)

fun1()
```
![](https://i.imgur.com/oLCj4p4.png)

## global範例 - 使用 global 修改全域變數
```python
# 定義全域變數
GA = 77

def fun1():
    # print('全域變數可直接獲取:', GA)  # GA 不可於 global GA 前使用

    # 若要修改全域變數，必須先用關鍵字 global 說明該函數要修改全域變數
    # 此外，使用 global 前，全域變數不可被使用，否則報錯
    global GA
    GA = 80
    print('全域變數可直接獲取，修改後:', GA)

print('fun1()前，全域變數 GA = ', GA)
fun1()
print('fun1()後，全域變數 GA = ', GA)
```

![](https://i.imgur.com/AlEP3gy.png)


# nonlocal 範例
*global* 是函數宣告自己要修改哪個全域變數，而 *nonlocal* 則是函數宣告自己要修改**上層(不侷限於前一層)函數中定義的變數**。

## nonlocal範例 - 定義局部變數
```python
# 定義巢狀函數第一層 fun2()
def fun2():
    # 定義局部變數
    a = 10
    print('fun2 的局部變數 a =', a)

    # 定義巢狀函數第二層 fun3()
    def fun3():
        print('fun3 呼叫上層定義的局部變數 a =', a)

        # 定義巢狀函數第三層 fun4()
        def fun4():
            print('fun4 呼叫上層定義的局部變數 a =', a)

        fun4()  # fun3 呼叫 fun4

    fun3()  # fun2 呼叫 fun3
    print('fun2 的變數 a 結果:', a)


# 執行函數
fun2()
```
![](https://i.imgur.com/yhi94kQ.png)


## nonlocal範例 - 使用 nonlocal 修改局部變數
若是在巢狀函數內，直接修改變數，則受影響的只有自己那層級之後(包含自己)。
![](https://i.imgur.com/vRvU7DO.png)

所以要透過關鍵字 *nonlocal* 說明函數即將修改先前定義過的局部變數，程式碼以及結果如下：
```python
# 定義巢狀函數第一層 fun2()
def fun2():
    # 定義局部變數
    a = 10
    print('fun2 的局部變數 a =', a)

    # 定義巢狀函數第二層 fun3()
    def fun3():
        print('fun3 呼叫上層定義的局部變數 a =', a)

        # 定義巢狀函數第三層 fun4()
        def fun4():
            # print('fun4 呼叫上層定義的局部變數，修改前 a =', a)
            
            # 透過關鍵字 nonlocal 說明函數要修改上層函數定義的局部變數
            nonlocal a
            a = 90
            print('fun4 呼叫上層定義的局部變數，修改後 a =', a)

        fun4()  # fun3 呼叫 fun4

    fun3()  # fun2 呼叫 fun3
    print('fun2 的變數 a 結果:', a)


# 執行函數
fun2()
```
![](https://i.imgur.com/QDnSG1O.png)

### 小提醒
注意，在 `fun4()` 中，透過 *nonlocal* 修改 `fun2()` 定義的局部變數 `a`，對於 `fun4()` 而言，變數 `a` 是其上層函數定義的**局部變數**，而**不是全域變數**。

但因為 **變數 `a` 在 `fun4()` 之前就定義了**，故我們仍可將 *nonlocal* 改成 *global*，這樣會使得 `fun4()` 的變數 `a` 變動，而不影響 `fun3()` 與 `fun2()` 的變數 `a`，**同時會在函數外部，建立一個全域變數 `a`**，如下：
![](https://i.imgur.com/jkAS0CL.png)





