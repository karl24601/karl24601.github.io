---
title:  "[Python]自學 Python 100 天，Enum型態"
date:   2020-03-15 21:10:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---

# 前言
列舉(Enumeration)型態用講的我也不會講，就直接看範例吧！

# 簡單範例
自定義類別與 Enum 類別，以及 Enum 類別基本使用
```python
from enum import Enum

# 自定義一個類別
class NewClass():
    New1 = 'track'
    
# 定義一個 Enum 型態的類別
class EnumClass(Enum):
    Attr1 = 'track'
    Attr2 = 'alpha'

########################

# 類別的屬性呈現？
print(NewClass.New1)   # 'track'
print(EnumClass.Attr2) # EnumClass.Attr2，而不是 'alpha'

# 類別的屬性有哪些？
print(dir(NewClass))   # New1 以及其他基本的屬性
print(dir(EnumClass))  # Attr1、Attr2，缺少許多一般類別的屬性。但額外擁有 __members__ 屬性。

# 能否建立物件？
a = NewClass()
b = EnumClass('track')  # 根據 EnumClass 的定義，要傳入一個參數
c = EnumClass('Attr1')  # ValueError，因為 'Attr1' 不是 EnumClass 定義的列舉值

# 物件型態為何？
print(type(a))  # <class '__main__.NewClass'>
print(type(b))  # <enum 'EnumClass'>

# 物件的內容
print(dir(a))  # 與 dir(NewClass) 相同
print(dir(b))  # 與 dir(EnumClass) 不同，但擁有 name、value 屬性

# Enum 類別物件屬性 name、value
# 由於 b 被初始化時，輸入的列舉值是 'track'，對應到的名稱為 Attr1
print(b.name)   # Attr1
print(b.value)  # track
```

## 稍微整理
看完上面的程式碼有沒有一點感覺了？
當我們定義一個類別為列舉型態時，該類別的屬性將會被賦予獨立的列舉值，就像 `EnumClass` 的屬性 `Attr1` 與 `Attr2` 被賦予列舉值 `'track'` 與 `'alpha'`。

當我們要建立列舉型態的物件時，必須輸入存在的列舉值才能成功產生，例如 `d = EnumClass('alpha')`，這個時候變數 `d` 的型態就是自定義的列舉類別 `EnumClass`，而該變數的值必須透過 `d.value` 來獲得(若用 `d.Attr2`，顯示的不是 `'alpha'`，而是 `EnumClass.Attr2`)。

# 快速宣告(建立？) Enum 類別

```python
# 回顧上述的 EnumClass 定義與使用如下：
class EnumClass(Enum):
    Attr1 = 'track'
    Attr2 = 'alpha'
    
b = EnumClass('track')
print(b)        # EnumClass.Attr1
print(type(b))  # <enum 'EnumClass'>
print(b.name)   # 'Attr1'
print(b.value)  # 'track'


# 其實我們也可這樣定義，列舉名稱相同，但列舉值不同
# 列舉變數 Attr1 與 Attr2 的列舉值分別為 int 型態的 1 與 2
b = Enum('EnumClass', ('Attr1', 'Attr2'))

print(b)        # <enum 'EnumClass'>
print(type(b))  # <class 'enum.EnumMeta'>
print(b.name)   # AttributeError，此時的變數 b 並沒有 name、value 屬性
```

# Enum 類別的用途？
終於進到正題了，到底列舉型態到底有什麼好處呢？說真的我也不是很瞭解XDD
但看了以下的程式碼或許會有一些感觸也說不定。

在編寫程式的時候，或多或少會遇到使用 **12個月**、**一星期** 的機會，像我最直覺的就是使用 `字典(dict)` 的方式來操作，如下：

```python
# 星期字典
week = {
    'Monday'   : 1,
    'Tuesday'  : 2,
    'Wednesday': 3,
    'Thursday' : 4,
    'Friday'   : 5,
    'Saturday' : 6,
    'Sunday'   : 7
}

# 使用方式
print(week['Monday'])  # 1
```

對於這種內容固定(數量有限)的資訊，使用 **列舉** 可能就比較直觀點，如下：
```python
# 以列舉類別方式定義
from enum import Enum
class Week(Enum):
    Monday     = 1
    Tuesday    = 2
    Wednesday  = 3
    Thursday   = 4
    Friday     = 5
    Saturday   = 6
    Sunday     = 7


# 或是用快速定義的方式
day = Enum('WEEK', 'Monday Tuesday Wednesday Thursday Friday Saturday Sunday')


# 使用方式分別為
print(Week.Monday.value)  # 1
print(day.Monday.value)   # 1
```

除了以上的介紹，個人認為要體現 Enum 型態的好處是透過類別定義的方式，也就是 **定義一個 Enum 型態的類別**，因為這種類別同時能達到 Enum 列舉的用途，還可以自定義一些函數。

例如我們今天要得到各式各樣的顏色，但大多人想到的顏色大部分都是基礎顏色，例如紅、黃、藍、黑、白等等，因此我們可以將這些基礎顏色做成列舉名稱，並賦予對應的 RGB 值作為列舉值，同時建立一個靜態函數供外部直接使用。

範例如下：
```python
from enum import Enum, unique
from random import randint

# 建立一個列舉型態的類別
# @unique 能夠檢查列舉是否有重複的列舉值
# 在參數中填上 Enum 宣告為列舉型態
@unique
class Color(Enum):
    # 定義一些基本顏色作為列舉名稱，而列舉值是其對應的RGB數值
    RED = (255, 0, 0)
    GREEN = (0, 255, 0)
    BLUE = (0, 0, 255)
    BLACK = (0, 0, 0)
    WHITE = (255, 255, 255)

    # 定義靜態方法，可以由外部直接使用
    @staticmethod
    def random_color():
        r = randint(0, 255)
        g = randint(0, 255)
        b = randint(0, 255)
        return (r, g, b)


# 這樣外部在使用 Color 類別時，能夠簡單的選擇基本顏色，或是要用隨機顏色
color1 = Color.RED.value  # color1 獲得 (255, 0, 0)
color2 = Color.random_color()  # 隨機獲得顏色 RGB
```

# 列舉名稱不可重複，若值重複則取第一個

1. 如果**名稱重複**的話，會得到 `TypeError: Attempted to reuse key`。
```python
from enum import Enum
class Week(Enum):
    Monday     = 1
    Monday     = 2  # 重複兩個 Monday
    Wednesday  = 3
```

2. 若**值重複**，則透過該列舉值回傳的名稱為第一個。
```python
from enum import Enum
class Week(Enum):
    Monday     = 1
    Tuesday    = 1  # 重複兩個列舉值 1
    Wednesday  = 3

# 透過列舉值 1 回傳的名稱為第一個名稱 Monday
print(Week(1))  # Week.Monday
```

3. 透過 `@unique` 可檢查列舉變數(類別)中，是否有重複的列舉值，記得要引入 `unique`。
```python
from enum import Enum, unique  # 引入 unique

@unique
class Week(Enum):
    Monday     = 1
    Tuesday    = 1  # 重複兩個列舉值 1
    Wednesday  = 3


# 會直接跳出
ValueError: duplicate values found in <enum 'Week'>: Tuesday -> Monday
```

# Enum 能比較是否相同，但無法直接比較大小
若要比較大小就必須先**確保列舉值是可以用於比較的型態**，例如 `int`、`float`。並透過 `value` 取值比大小。
```python
from enum import Enum

class Week(Enum):
    Monday     = 1
    Tuesday    = 1  # 重複兩個列舉值 1
    Wednesday  = 3.2
    Thur = 'Thursday'
    
    
# 比較是否相同，不須透過 .value
print(Week.Monday == Week.Tuesday)    # True
print(Week.Monday == Week.Wednesday)  # False

# 比較大小要先確定列舉值可被比較，再透過 .value 取值
print(Week.Monday.value == Week.Tuesday.value)  # True
print(Week.Monday.value < Week.Wednesday.value)  # True

# 不取值(.value) 只能比較是否相同
# 不可比較的值當然會報錯
print(Week.Monday < Week.Wednesday)  # TypeError: '<' not supported
print(Week.Monday.value < Week.Thur.value)  # TypeError: '<' not supported
```









---

# 參考連結
1. [enum — 枚舉型態 — 你所不知道的 Python 標準函式庫用法 07](https://blog.louie.lu/2017/08/02/%E4%BD%A0%E6%89%80%E4%B8%8D%E7%9F%A5%E9%81%93%E7%9A%84-python-%E6%A8%99%E6%BA%96%E5%87%BD%E5%BC%8F%E5%BA%AB%E7%94%A8%E6%B3%95-07-enum/)
2. [Day28-enum --iT邦幫忙](https://ithelp.ithome.com.tw/articles/10195915)



