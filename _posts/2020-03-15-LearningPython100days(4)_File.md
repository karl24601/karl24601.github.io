---
title:  "[Python]自學 Python 100 天，文件"
date:   2020-03-15 21:11:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---


# 前言
讀寫文件是程式設計中必備的一環，Python 當然也有讀寫文件的能力，本篇將介紹如何讀寫文件。

# 基本範例
這邊先寫一小段讀取文件的範例，同時說明之。
```python
# 透過 open() 開啟文件
# file 表示文件的路徑(絕對或相對皆可)，
# mode 表示要做的功能('r' 代表讀取)，
# encoding 表示文件的編碼，常見的中文編碼為 'utf-8' 或 'big5'
f = open(file='example.txt', mode='r', encoding='utf-8')

# 透過 .read() 將讀取的內容 "全部" 印出
print(f.read())

# 由於開啟文件會占用資源，所以最後要 .colse() 將資源釋放
f.close()
```

在這段簡短的程式碼中，最重要的是 **「有 `open()` 就有 `close()`」**，如果沒有 `close()`，那最後就是資源不斷地被占用哦。

**至於怎麼占用？** 
有時候我們要刪除文件時會跳錯誤，告知我們文件正被使用中，這就是最直接的例子囉。


## 利用 `with open():` 開啟文件

有時候我們可能會忘記打上 `close()` 導致記憶體被占用而不自知，而 Python 很貼心的提供 `with open():` 的語法，在每次文件結束使用時都自動進行關閉的動作，這樣我們就不會有忘記釋放資源的困擾囉！

與範例相同的效果，但寫法如下：
```python
with open(file='example.txt', mode='r', encoding='utf-8') as file:
    print(f.read())
```


> 在讀取文件時，電腦會記錄自己讀檔的位置，例如用 `read()`，一口氣讀完整個文本後，讀檔位置就會跑到最後，因此無法再以 `read()` 重新讀檔(因為已經在文末了)，
> 這時必須重置讀檔位置，透過 `seek(0)` 表示位置回到開頭(第0個字元)，這樣才能再繼續讀到內容。
> 
> 而讀取文本不是只有 `read()`，也有 `readline()`、`readlines()` 等等，這些內容在參考連結提供的 youtube 影片可以得到。


## 如何寫入文件？
以上簡單介紹 **讀取** 文件的方法，那如何 **寫入** 呢？
其實很簡單，只要將 `mode='r'` 改成 `mode='w'` 即可，由於寫入文件也有 `open()`，所以最後也要 `close()`。
不過 Python 都這麼貼心了，我們就直接用 `with open()` 吧！

```python
# 寫入文件
# 改成 mode='w'，並提供寫入的編碼，寫入中文多用 utf-8
# 透過 .write() 寫入文件
with open(file='exam.txt', mode='w', encoding='utf-8') as file:
    file.write('隨便寫一段內容' + '\n')
```

> 注意，透過 `mode='w'` 寫入文件時，會**將文件原始內容清空，再寫入**(如果沒有該文件就會自行建立文件)。


## 讀取圖片用二進制法
不論是圖片、音樂、影片都是採用二進制編碼(也就是只有電腦才看得懂)。
若我們要**讀取圖片**，那這個時候我們要採用的是 `mode='rb'`，至於 `encoding` 就不需要囉。
(如果是寫入二進制內容，就是 `mode='wb'`)

```python
with open(file='gui8.png', mode='rb') as pic_file:
    data = pic_file.read()
    print(type(data))  # <class 'bytes'>
```

如果想要看一下圖片的話，就要用到第三方模組 `PIL`，這邊就不多做簡介，如下圖：
![](https://i.imgur.com/po9jAOC.png)


## 更多的操作方式(`mode`)
除了上述的 `'r', 'w', 'rb'`，其實還有其他操作方式，整理如下：

| 操作模式 | 用途 |備註|
|------- | -------------------------------- |-|
| `'r'`  | 讀取(預設值)| 若不存在檔案，會報錯(產生異常) |
| `'w'`  | 寫入(會清空原始內容)| 若檔案不存在會自動建檔 |
| `'x'`  | 寫入 | 如果文件已經存在會產生異常 |
| `'a'`  | 追加(append) | 將內容寫入文件的尾部 |
| `'b'`  | 二進制模式 |
| `'t'`  | 文本模式(默認) |
| `'+'`  | 更新(既可以讀又可以寫) |

大致內容可解釋如下圖：
![](https://i.imgur.com/cAqP5nA.png)

---

# 淺談 JSON 檔案
JSON 的全名為 "JavaScript Object Notation"，原屬於 JavaScript 的語法，也是純文本。

目前在數據傳遞相當常見，例如網頁前後端，不確定是否因為資料結構簡單，而造就這樣的結果(未來有找資料再補充 -//-)

簡單的 JSON 格式如下：
```python
{
    "name": "John",
    "age": 38,
    "language": ["Python", "Java"],
    "products": [
        {"title": "Android", "cost": 180},
        {"title": "MacOS", "cost": 280},
    ]
}
```
從這個 JSON 範例中會發現，JSON 格式與 Python 中的字典(dictionary)格式很類似。

也因此 Python 可以藉由 `json` 模組，將字典(dict)或列表(list)以 JSON 格式保存，方式如下：
```python
import json

python_dict = {
    "name": "John",
    "age": 38,
    "language": ["Python", "Java"],
    "products": [
        {"title": "Android", "cost": 180},
        {"title": "MacOS", "cost": 280},
    ]
}


# JSON 的讀寫
# 讀: laod(json格式檔案)、
#     loads(轉換成字串的json檔案)
# 
# 寫: dump(內容為json格式的變數，目標檔案)、
#     dumps(將json格式轉成字串)  ->  還要再用 file.write() 將字串寫入

# 儲存成 JSON 格式
with open('data.json', 'w', encoding='utf-8') as file:
    json.dump(python_dict, file)  # 透過 json.dump() 將 python_dict 倒入 file 文件中

# 如果要讀取 json 文件，可透過 json.load()
with open('data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)
    print('以 json.load() 讀取：', type(data))


# 以 dumps 進行 json 格式輸出與 loads 讀取 json 檔案
with open('data_str.json', 'w', encoding='utf-8') as file:
    str_data = json.dumps(python_dict)  # json.dumps 會輸出 string
    print('以 dumps() 寫入：', type(str_data))  # <class 'str'>
    file.write(str_data)  # 還要用 write 將字串寫入文件

with open('data_str.json', 'r', encoding='utf-8') as file:
    str_data = file.read()
    data2 = json.loads(str_data)  # loads 是讀取 string，而不是直接讀取 json 文件
```

## 稍微整理
要特別注意，json 提供讀取的方式有 `load()` 與 `loads()`
* `load()` 直接將 json 資料做參數
* `loads()` 的參數是字串。所以要先將 json 資料讀取成字串，再透過 loads() 轉換
 
寫入的方式 `dump()` 與 `dumps()`
* `dump()` 直接將 json 格式的變數輸出成 json 檔案
* `dumps()` 並不會輸出 json 檔案，而是輸出成**字串**，所以要再透過 `write()` 將 json 字串寫入文件





# 參考連結
1. [Python - 100天从新手到大师](https://github.com/jackfrued/Python-100-Days)
2. 魏蘶youtube [[Python 學習筆記] 23-File IO](https://www.youtube.com/watch?v=kPc75bW0pfE&list=PL3VInsFtJyIN6xlIQGaHdWJFGPQSNAIKR)










