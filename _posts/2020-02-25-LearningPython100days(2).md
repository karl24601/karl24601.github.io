---
title:  "[Python]自學 Python 100 天，類別"
date:   2020-02-25 18:27:42 +0800

tags:
    - python

toc: ture
toc_label: "概覽"
---

# 前言
這篇文章主要說明 Python 中類別的概念以及如何使用。

# Day08 整理
* 在 Day08 中，介紹了 **類型(class)** 與 **物件(object)**。
* 物件導向(Object-oriented programming，縮寫：OOP)，其想法可表示如下：
    > 把一組數據結構和處理它們的方法組成物件(object)，把相同「行為」的object 歸納為類型(class)。
    > 通過 class 的封裝(encapsulation)「隱藏內部細節」，
    > 通過繼承（inheritance）實現 class 的特化(specialization)和泛化(generalization)，
    > 通過多型(polymorphism)實現基於 object 類型的動態分派。

* 「class 是一個抽象的概念，object 則是具體的東西」，因為要先有 class，才能產生 object。
    > 例如我們要先建立 Student 類別，才能產生 Student 的物件。
    > 
    > 物件有時又稱為實體(instance)。
* object 具有屬性(attribute)與行為(或稱方法，method)。
* 在物件導向的程式語言中，**訪問權限**是個重要的事情，一般來說會將 object 的**屬性**設為私有(private，不可被繼承)或受保護的(protected，可被繼承)，而**方法**多被設為公開(public)。
* 在 python 中，只有公開與私有，**若希望屬性為私有，則在為屬性命名時，可用兩個下底線作為開頭**，如下：

```python
class Test:

    # object 在建立時會透過 __init__() 進行初始化，也就是建構子。
    def __init__(self, foo):
        # self.  就是該物件的屬性
        # 以兩個下底線做開頭，會變成私有
        self.__foo = foo

    # 物件的方法就是透過 函數 來達成
    # 函數也可以是私有函數
    def __bar(self):
        print(self.__foo)
        print('__bar')


def main():
    a = Test('hello')
    
    a.__bar()
    # 回報錯誤 AttributeError: 'Test' object has no attribute '__bar'
    
    print(a.__foo)
    # 回報錯誤 AttributeError: 'Test' object has no attribute '__foo'
    
    # 如果要使用使用私有的屬性或函數，則必須藉由以下方式
    a._Test__bar()
    print(a._Test__foo)
    

if __name__ == "__main__":
    main()
```
* 由以上程式碼可以知道，雖然 python 有分成公開與私有，但仍可透過特別的方式存取私有的屬性或函數。
* 雖然沒有受保護的(protected)，但慣例上，**「一個下底線」做開頭的**屬性或函數是暗示他們為**受保護的**。藉此告知其他程式設計師，在使用這個屬性或函數時要特別注意。

## Day08-1 封裝 Encapsulation
* 封裝是為了將實作內容隱藏，例如只想告訴使用者，當要排序元素時可使用 sort() 但不告訴使用者該函數的內容為何，這就是封裝。
![](https://i.imgur.com/i22bgFU.png)




# Day09 整理
## @property 裝飾器(setter、getter、~~deleter~~)
* 在 Day08 介紹過，python 並不能宣告類別的屬性或函數為可保護的(protected)，而我們也只能透過命名的方式，暗示其他程式設計師那些屬性或函數是可保護的(以一個下底線為開頭)；而兩個下底線為開頭者，則為私有的(private)。
當屬性或函數為私有的，則該屬性或函數便無法直接於外部使用。
    > 可以參考[這篇](https://medium.com/bryanyang0528/python-setter-%E5%92%8C-getter-6c08a9d37d46)，個人認為這個作者用鋼彈駕駛能否簡單被替換的方式，說明私有屬性的優點與缺點頗適合的～
    >
    > 也可參考[另一篇](https://www.maxlist.xyz/2019/12/25/python-property/)。

* 但實際上，python 的**私有屬性**，其實可透過 `@property` 操作之，如下：

```python
# 建立一個帳戶類別，該類別之屬性包含 姓名、Id、密碼、金額

class Account():
    def __init__(self, name):
        self.__name = name
        self.Id = 'aaa123'
        # self.money = 0
        
    # 以下以兩種方法顯示 私有屬性 __name
    # 以公有函數讀取私有屬性
    def returnName(self):
        return self.__name

    # 以 @property 方式(此為getter方式)，讀取 私有屬性 __name
    @property
    def name(self):
        return self.__name

    # 以 @property 方式(此為getter方式)，讀取 公有屬性 Id
    @property
    def Id_property(self):
        return self.Id

    # 以 @property 方式(此為setter方式)，修改 公有屬性 Id
    # 注意 .setter 前的名稱，必須先以 @property 建立過
    @Id_property.setter
    def Id_property(self, newId):
        self.Id = newId

    # 以 property 方式建立暫時屬性(但實際上該類別沒有等等建立的屬性(即password))
    @property
    def password(self):
        return '別想看我密碼 :P'

    # 用 setter 方式，建立 pd 屬性(pd 是 Account 的屬性，只是沒在初始化時被建立而是透過 @password.setter 方式建立)
    @password.setter
    def password(self, yourPassword):
        self.pd = yourPassword

    # 以 property 呼叫尚未產生的屬性
    @property
    def yourMoney(self):
        return self.money

    # 以 setter 建立尚未產生的屬性
    @yourMoney.setter
    def yourMoney(self, money):
        self.money = money

```

實用結果：
```python
def main():
    Acc1 = Account('John')

    # 在外部呼叫私有屬性 __name
    print(Acc1.returnName())  # John  # 用函式呼叫
    print(Acc1.name)  # John  # 用 property 呼叫，看起來 Account 有 name 這個屬性(但實際上沒有)

    print('----')

    # 在外部呼叫公有屬性 Id
    # 因是公有屬性，可直接讀寫之
    print(Acc1.Id)  # aaa123  # 直接呼叫
    print(Acc1.Id_property)  # aaa123  # 透過 property 呼叫，但實際上 Account 類別沒有 Id_property 這個屬性

    # 修改公有屬性 Id
    Acc1.Id = 'bbb234'  # 直接修改
    print(Acc1.Id)  # bbb234
    Acc1.Id_property = 'ccc456'  # 以 property (setter方式)修改之
    print(Acc1.Id)  # ccc456

    print('----')

    print(Acc1.password)
    # print(Acc1.pd)  # 雖然 pd 沒有在建立物件時被初始化，但 pd 是 Account 類別的屬性
                      # 只是在目前還沒被建立，所以此時 print(Acc1.pd) 會 Error
    Acc1.password = '1234'  # 看似 Acc1 有 password 屬性，但實際上 '1234' 是被 pd 屬性得到
    print(Acc1.pd)  # 1234

    print('----')

    # print(Acc1.yourMoney)  # 會 Error，因為 money 屬性尚未建立
    Acc1.yourMoney = 100  # 以 setter 方式建立 money 屬性
    print(Acc1.yourMoney) # 100  # 以 property 呼叫 money 屬性
    print(Acc1.money)  # 100  # 直接呼叫 money 屬性(因為是公有，可以直接呼叫)
    
    print('----')
    
    # 注意，python 允許新增屬性，例如我們新增一個屬性 newAttr
    # 而該屬性並沒有在該類別被定義
    Acc1.newAttr = 885
    print(Acc1.newAttr)  # 885

if __name__ == '__main__':
    main()
```
### 稍微整理：
* `@property` 可以減少「受保護的、私有的」屬性被改動的風險。
* `@property` 定義時很像在定義函數，但使用時卻像使用屬性。
* 要先透過 `@property` 定義暫時屬性的名稱，才能用 `setter`。


## \_\_slots\_\_
* 由 `@property` 可知 Python 能在程式運行時為物件綁定新屬性或方法(其實沒有 `@property` 也能增加)，故可說 Python 是一門動態得程式語言。
* `__slots__` 可用以限制某個類別只能擁有那些屬性(其子類別就不受限制)。

```python
class Person(object):

    # 限定 Person 物件只能綁定 _name、 _age、 _gender 三種屬性
    __slots__ = ('_name', '_age', '_gender')

    def __init__(self, name, age):
        self._name = name
        self._age = age

    @property
    def name(self):
        return self._name

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self, age):
        self._age = age

    # 可以定義 @property 產生暫時屬性 hair
    # 再透過 @property 的 setter 方式建立 _hair 屬性
    # 但實際上不能執行，因為已經透過 __solts__ 綁定屬性只有 _name、 _age、 _gender
    @property
    def hair(self):
        return self._hair

    @hair.setter
    def hair(self, color):
        self._hair = color

    def play(self):
        if self._age < 18:
            print('%s 不能觀賞成人網站.' % self._name)
        else:
            print('%s 正在瀏覽OOXX.' % self._name)
```
```python
def main():
    # 建立 Person 物件: person
    person = Person('John', 22)
    print(person._name)  # John  # _name 只是暗示受保護，所以外部仍可讀取
    
    person.play()
    
    person._gender = 'Male'  # _gender 暗示為受保護的屬性，所以仍可直接寫入
    
    person._name = 'Levi'
    print(person.name)  # Levi  # name 是透過 property 產生的暫時屬性

    # person.hair = 'brown'  # Error: 因為已經限制 __solts__
    # print(person.hair)
    

if __name__ == '__main__':
    main()
```

## 物件方法(instance method)、靜態方法(static method)以及類別方法(class method)
* 在建立類別時，會定義許多函數(方法)，大部分這些函數都是物件方法(或稱實體方法，instance method)。
而物件方法表示這些方法都是傳給物件，供物件使用的函數。
然而，在類別中所定義的函數，並不是全部都非得讓物件使用。
    > 例如我們定義一個 Triangle 類別，通過傳入 3 個長度以建立 Triangle 物件
    > 
    > 但傳入的 3 個邊長並不一定能夠成三角形，所以我們可以先寫一個方法來確定傳入的邊長能否構成三角形。
    > 此時這個方法就不是給物件使用的(因為是用來驗證傳入的長度是否能夠成三角形，所以此時物件應該還不會被建立才對)，
    > 因此這個方法是屬於 Triangle 類別，而不是 Triangle 物件的。

### 建立屬於類別的方法可透過 **靜態方法** 或 **類別方法** 來達成
#### 1. 透過 **靜態方法(static method)** 以建立類別用的方法，如下：
* 注意：只有定義物件方法(或稱為實體方法、實例方法, instance/object method)時，第一個參數一定要 `self`。

```python
class Triangle(object):

    # 定義建構元(初始化函數)，包含 3 個屬性
    def __init__(self, a, b, c):
        self._a = a
        self._b = b
        self._c = c

    # 靜態方法，供 Triangle 類別使用的方法(不是給 Triangle 物件的)
    # 注意參數內並沒有 self
    @staticmethod
    def is_valid(a, b, c):
        return a + b > c and b + c > a and a + c > b

    # 物件方法，供 Triangle 物件使用的方法
    def perimeter(self):
        return self._a + self._b + self._c
```
```python
def main():
    a, b, c = 3, 4, 5
    
    # 使用靜態方法，注意開頭直接是對應的類別
    if Triangle.is_valid(a, b, c):
        # 建立 Triangle 物件 t
        t = Triangle(a, b, c)
        
        # perimeter() 為物件方法，所以是透過物件 t 呼叫
        print(t.perimeter())
        
        # 也可以透過類別使用物件方法，但要傳入參數
        # 因為是物件 t 要呼叫物件方法 perimeter()，所以傳入的參數就是物件 t
        print(Triangle.perimeter(t))
        
    else:
        print('無法構成三角形.')


if __name__ == '__main__':
    main()
```

#### 2. 透過 **類別方法(class method)** 以建立類別用的方法，如下：
* 除了靜態方法外，python 也可透過 類別方法(class method)，建立一個可供類別本身使用的函數。
* 因為不需要透過物件就能使用類別方法，所以定義類別方法時，其參數不為 `self`，而類別方法與靜態方法不同的是，**定義類別方法時，其第一個參數必須為 `cls`**。
* 此 `cls` 參數表示，將整個類別(class)當作物件傳入該類別方法，若類別方法要回傳該類別之物件時，會寫成 `return cls(建構該類別之物件時所需參數)`。
* 注意：定義類別方法(class method)時，第一個參數一定是 `cls`。

```python
# 建立一個稱為 User 之類別
class User:
    active_users = 0  # 該類別之共同屬性，並不是物件專屬的

    # 定義類別方法，注意參數部分填入的是 cls 而不是 self
    @classmethod
    def disp_active_users(cls):
        return f"There are currently {cls.active_users} active users."

    # 定義類別方法，該方法使用時需要提供參數 data_str，且會回傳 User 物件
    # 注意在回傳的部分，因為定義時第一個參數為 cls 以表示 User 類別
    # 所以回傳時，透過 cls(...) 來建立 User 物件，輸入的參數根據 __init__ 的要求
    @classmethod
    def from_string(cls, data_str):
        first, last, age = data_str.split(",")
        return cls(first, last, int(age))  # 注意回傳透過 cls() 建立物件

     # 定義建構元，因為是給物件使用，所以要有 self 參數
    def __init__(self, first, last, age):
        self.first = first
        self.last = last
        self.age = age
        User.active_users += 1  # 當建立一個 User 物件時，User 類別的共同屬性 active_users 會加 1
```
```python
def main():
    user1 = User("Joe", "Smith", 68)  # 建立出 user1 時，active_users = 1
    user2 = User("John", "Walker", 108)  # 建立出 user2 時，active_users = 2
    user3 = User.from_string("Jason,Liao,5")  # 透過類別方法建立出 user3 ，建立成功後 active_users = 3

    print(User.disp_active_users())

if __name__ == "__main__":
    main()
```

### 稍微整理
1. 類別中的方法分成 實體方法(instance methof)、靜態方法(static method) 與 類別方法(class method)。
2. 實體方法是供物件使用，因此在定義時，其第一個參數必須為 `self`。
3. 靜態方法與類別方法不須先有該類別之物件也可使用，所以定義靜態方法、類別方法時，其參數不會有 `self`。
4. 靜態方法定義前要加上關鍵字 `@staticmethod`，類別方法定義前要加上關鍵字 `@classmethod`。
5. 靜態方法與類別方法之差異在於定義時，類別方法第一個參數為 `cls`，表示使用類別方法時，將以自身的類別作為物件傳入類別方法；而靜態方法則沒有此限制。

## 類別之間的關係
* 類別與類別之間的關係分成：is-a、has-a 與 use-a。
    > 1. is-a 又稱為繼承或泛化。例如學生與人的關係。
    > 2. has-a 例如公司部門與員工。
    > 3. use-a 例如司機與交通工具。

### 繼承(inheritance)與多型(polymorphism)
* 接下來介紹 **繼承**，繼承是指「我們可以建立一個新的類別，而該類別能夠獲得、使用既有的舊類別」。
* 新類別又稱為 **子類別(或衍生類別)**；而舊類別又稱為 **父類別(或基礎類別、超類別,super)**。
* 子類別能繼承父類別的屬性、方法，也可以重新定義屬性或方法(又稱為覆寫, override)，或是再定義新的屬性或方法。
* 因為子類別可以改寫父類別既有的方法，所以若多個子類別繼承自同一父類別，同一個方法可能就會有多個版本，當我們使用該方法時便會根據使用的類別而定，這種 **「同一方法能根據不同的類別而有不同的實作內容」就是多型**。

---

* 定義子類別時，其括號內要放入父類別的名稱；若繼承自多個父類別，則所有父類別都要寫入，又稱為多重繼承。
* 單一繼承寫法為: `class ChildClass(FatherClass):`
* 多重繼承寫法為: `class ChildClass(FatherClass1, FatherClass2, ...):`
* 多重繼承下，該子類別在初始化時將與第一個父類別的初始化函數有關。

---

> *若父子類別皆有初始化函數( `__init__(self, ...)` ,也就是建構元)，則在產生子類別之物件時，使用的是哪一個建構元呢？*
> 1. 子類別可以不含建構元。
> 2. 父子類別若有建構元，則子類別除了對自己的屬性做初始化之外，也要將父類別的屬性做初始化，也就是父類別有甚麼屬性，子類別在初始化時都要考慮進去。寫法有三種，如下：
> ```python
> # 父類別內容。
> class FatherClass():
>     def __init__(self, first, second):
>         self.first = first
>         self.second = second
> ```
> ***第一種方法: 將父類別的屬性全部寫在子類別的初始化函數中***。
> ```python
> # 第一種方法: 將父類別的屬性全部寫在子類別的初始化函數中。
> # 記得子類別的括號要寫入父類別的類別名稱。
> # 子類別的初始化函數定義時，參數也要包含父類別初始化所需參數。
> class ChildClass(FatherClass):
>     def __init__(self, first, second, age, habit):
>         self.first = first
>         self.second = second
>         # 父類別的屬性都要初始化
>         self.age = age
>         self.habit = habit
> ```
> ***第二種方法: 直接在子類別的初始化函數中，使用父類別的初始化函數***。
> ```python
> # 第二種方法: 直接在子類別的初始化函數中，使用父類別的初始化函數。
> # 這樣就不用將父類別的屬性再寫一次。
> # 子類別的初始化函數定義時，參數也要包含父類別初始化所需參數。
> class ChildClass(FatherClass):
>     # 參數部分還是要包含父類別初始化時所需的參數。
>     def __init__(self, first, second, age, habit):
>         # 直接使用父類別的初始化函數，而第一個參數要為 self。
>         FatjerClass.__init__(self, first, second)
>         self.age = age
>         self.habit = habit
> ```
> ***第三種方法: 透過 super() 使用父類別的初始化函數***。
> ```python
> # 第三種方法: 與第二種方法類似，也是直接使用父類別初始化函數。
> # 只是這方法是透過超函數加以完成，即 super().__init__(self, *arug)
> # 這樣就不用將父類別的屬性再寫一次。
> # 子類別的初始化函數定義時，參數也要包含父類別初始化所需參數。
> class ChildClass(FatherClass):
>     # 參數部分還是要包含父類別初始化時所需的參數。
>     def __init__(self, first, second, age, habit):
>         # 透過 super() 使用父類別的初始化函數，第一個參數不需為 self。
>         super().__init__(first, second)
>         self.age = age
>         self.habit = habit
> ```

**以下寫一個小小的程式碼，看一下繼承的用法以及實現相同函數名稱不同的實作內容**：

```python
# 定義父類別 Person
class Person():
    def __init__(self, name, age):
        self._name = name
        self._age = age

    def action(self, word):
        return f"我是 {self._name}，我聽到你說 {word}。"

# 定義子類別 Teacher，別忘了定義時參數要寫上父類別的名稱。
# Teacher 以 FatherClass.__init__(self,..) 方式加入父類別屬性
class Teacher(Person):
    # 初始化參數要包含父類別的初始化參數
    def __init__(self, name, age, level):
        Person.__init__(self, name, age)
        self._level = level

    def action(self):
        return f"{self._name} 是 {self._level} 老師。"

# 定義子類別 Student
# Student 以 super() 方式加入父類別屬性，透過 super() 則參數不用加 self
class Student(Person):
    def __init__(self, name, age, Id):
        super().__init__(name, age)
        self._id = Id

    def action(self, subject):
        return f"{self._name} 是學生，年紀 {self._age} 歲，喜歡的科目為 {subject}。"
```
```python
def main():
    old_man = Person("Alen", 1000)
    print(old_man.action("你太老了吧..."))  # 我是 Alen，我聽到你說 你太老了吧...。

    Shiao = Teacher("SC. Shiao", 30, "NCKU")
    print(Shiao.action())  # SC. Shiao 是 NCKU 老師。

    Joe = Student("Joe Lee", 25, 6163)
    print(Joe.action("Coding"))  # Joe Lee 是學生，年紀 25 歲，喜歡的科目為 Coding。

if __name__ == "__main__":
    main()
```

### 抽象類別(abstract class)
* 抽象類別的特色就是 **不能產生物件**，該類別專門讓其他類別繼承之。
* Python 作為動態語言，並不能直接定義抽象類別，若真的要產生一個抽象類別(也就是不能實體化的類別)，則要透過 `abc` 模組的 `ABCMeta` 與 `abstractmethod` 來完成。

**以上一個範例，將 Person 類別改為抽象類別**：

```python
from abc import ABCMeta, abstractmethod

# 定義抽象類別 Person
# 抽象類別括號內要加上額外參數 metaclass=ABCMeta
class Person(metaclass=ABCMeta):
    def __init__(self, name, age):
        self._name = name
        self._age = age

    # 針對要被多型使用的函數，加上 @abstractmethod
    @abstractmethod
    def action(self, word):
        return f"我是 {self._name}，我聽到你說 {word}。"

# 子類別 Teacher
class Teacher(Person):
    def __init__(self, name, age, level):
        Person.__init__(self, name, age)
        self._level = level

    def action(self):
        return f"{self._name} 是 {self._level} 老師。"

# 定義子類別 Student
class Student(Person):
    def __init__(self, name, age, Id):
        super().__init__(name, age)
        self._id = Id

    def action(self, subject):
        return f"{self._name} 是學生，年紀 {self._age} 歲，喜歡的科目為 {subject}。"


def main():
    # old_man = Person("Alen", 1000)  # Error，因為 Person 變成抽象類別，不能實體化

    Shiao = Teacher("SC. Shiao", 30, "NCKU")
    print(Shiao.action())  # SC. Shiao 是 NCKU 老師。

    Joe = Student("Joe Lee", 25, 6163)
    print(Joe.action("Coding"))  # Joe Lee 是學生，年紀 25 歲，喜歡的科目為 Coding。


if __name__ == "__main__":
    main()
```
