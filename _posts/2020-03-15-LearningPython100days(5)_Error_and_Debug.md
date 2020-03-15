---
title:  "[Python]自學 Python 100 天，錯誤處理(異常)以及debug"
date:   2020-03-15 21:20:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---

# 前言
在寫程式的過程中一定會遇到報錯的情況，錯誤百百種，一開始只會看一下錯在哪一行然後找一下附近有沒有怪怪的，但這樣會花不少時間。

而本篇將會介紹 Python 中各種錯誤，這樣下次跳出錯誤的時候，就可以從 Python 提示的錯誤中，以較有效率的方式找出錯誤的地方～

# 錯誤介紹
* **SyntaxError** : 拼字拼錯，不夠瞭解語法。
* **NameError** : 變數未定義
* **TypeError** : 參數型態輸入或參數個數錯誤
* **IndexError** : 取用的 index 超出範圍(成員不存在)
* **ValueError** : 輸入的參數型別正確，但值是錯的
* **KeyError** : 沒有找到 key
* **AttributeError** : 沒有這個屬性或方法

```python
# SyntaxError
print("Hello)  # 不瞭解語法，少一個引號

# NameError
print(A)  # 沒有定義的變數

# TypeError
int(['ABS'])  # int() 的參數必須為 string
int('20', '3')  # int() 只能輸入一個字串

# IndexError
A = [1, 2, 3]
print(A[4])  # A 的 index 只有 0,1,2

# ValueError
int('ABS')  # 雖然參數是 string，但必須為數字

# KeyError
B = {'first':1, 'second':2}
print(B['Third'])  # 沒有 'Third' 這個 key

# AttributeError
C = 'Go to bed.'
C.what()  # 字串沒有 what() 這個屬性(方法)
```

# 丟出錯誤 - raise
程式大多都必須跟使用者互動，有時候使用者胡搞瞎搞亂輸入一通時，如果程式還能運行那就太神了，但實際上是不可能的，所以**讓使用者明白哪裡出錯**是程式設計很重要的一環。

這一小節介紹如何丟出錯誤，就像 Python 告訴我們各種錯誤一樣，我們也可以告訴使用者你做錯了甚麼。

## 基本丟出錯誤的小範例：
```python
# 利用 raise 丟出錯誤
raise ValueError('RRRRR?')  # 讓程式丟出 ValueError，提供的原因是 RRRRR?

# 結果如下
```
![](https://i.imgur.com/Jko86FG.png)


## 進階範例：
實際上告訴使用者錯誤當然更複雜一點，如下：

```python
def colorize(text, color):
    colors = ('red', 'green', 'blue')
    if type(color) is not str:
        raise TypeError('color must be string')
    if type(text) is not str:
        raise TypeError('text must be string')
    if color not in colors:
        raise ValueError('invalid color')
    print(f'printed {text} in {color}')


colorize('black tea', 'red')  # printed black tea in red

# 如果使用者輸入不恰當，就會跳出對應的錯誤
colorize('black tea', 'black')  # ValueError: invalid color
colorize('black tea', 255)  # TypeError: color must be stri
```

# 搭配 `try...except` 進行錯誤處理
首先介紹 Python 貼心的語法，`try...except...else...finally`
透過這樣的語法，即使 Python 程式有錯誤也會繼續執行下去(前提是錯誤的部分是放在這段語法內)

大致內容可表示成：
```python
# 程式碼可以嘗試輸入以下三種選擇，觀察程式碼如何運行
# 10   ->  沒問題的輸入
# '任意文字'   ->  不能執行 int() 的輸入
# 0   ->  導致分母為 0 的輸入

try:
    num = int(input('隨意輸入...'))
    ans = 100/num
except ZeroDivisionError:
    print('第一個except區塊:')
    print('try的部分出錯了!因為0不可當分母\n')
except:
    print('第二個except區塊:')
    print('try的部分出錯了!輸入非數字會導致錯誤，請輸入數字\n')
else:
    print('else區塊:')
    print('try的部分正確，所以會再跑else部分\n')
finally:
    print('finally區塊:')
    print('不管try的部分正確與否，都會跑finally的部分\n')

print('try...except中，就算有問題也可以跑到後面哦')
```
也就是說，
1. `try` 的程式碼沒問題，會接著跑 `else`，再跑 `finally`
2. `try` 的程式碼有錯誤，會接著跑 `except`，再跑 `finally`，將不會跑 `else`。
3. 可以定義多個 `except` 區塊，再後方加上錯誤的種類，當 `try` 出錯時，會依據錯誤的種類跑對應的 `except`。
4. 無論 `try` 是否會出錯，`finally` 都會跑。
5. 錯誤的程式碼存在於 `try` 當中，就不會導致程式碼被中斷(但`except`,`else`,`finally`如果有錯還是會中斷)

# Python debugger - pdb
這節來介紹 Python 如何抓臭蟲(debug)，用到的模組(函式庫)稱為 `pdb` 也就是 "Python debugger" 的縮寫。

廢話不多說，直接看怎麼使用 `pdb`：
```python
import pdb

# l(list):列出所有的程式碼
# n(next):下一行
# c(continue):繼續/離開 debug 程式
# p(print):印出想查詢的變數，例如有一個變數叫 c，剛好與指令重複，所以可以打 p c

A = 'First'
B = 'Second'
res = A + B

pdb.set_trace()  # 在想要觀察的部分加入 pdb.set_trace() 這樣程式會在這行暫停
c = 'Third'  # 故意寫一個跟指令重複的變數名稱
res += c

print('最後一行啦:')
print(res)

```
運行程式碼後會像下圖，
![](https://i.imgur.com/IcrNum6.png)





# 參考連結
1. 魏蘶youtube [[Python 學習筆記] 15-錯誤處理](https://www.youtube.com/watch?v=LHz_nh9r5Ss&list=PL3VInsFtJyIN6xlIQGaHdWJFGPQSNAIKR&index=9)
