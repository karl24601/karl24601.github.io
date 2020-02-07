---
title:  "建立部落格初體驗(1)"
date:   2020-02-05 21:10:42 +0800

tags:
  - jekyll
---

# 前言
其實自己在大學時，對於編寫程式碼是感到相當害怕的，可能是看到密密麻麻的內容，覺得高深莫測而不敢觸碰。直到進入研究所後，與研究室學長共同執行一項計畫，認識了 matlab，才讓我對程式的敬畏放下了一些。
同時研究室又是做數值模擬，所以非得學習如何編寫程式。

在這段時間我開始使用 HackMD 紀錄自己的研究心得、程式碼等等，最後想說可以分享一些自己的經歷，才發現，原來建立部落格可以透過 GitHub 完成。

以下是透過 Windows 系統，學習如何安裝 jekyll，再到建立專屬自己的部落格。

---

# 1. 在Windows系統中安裝 jekyll
安裝的教學可參考[jekyll官網](https://jekyllrb.com/docs/installation/windows/)。

在安裝 jeykll 之前，必須先安裝 Ruby。而最簡單的方式是透過[RubyInstaller](https://rubyinstaller.org/)安裝。

為了省去麻煩，我直接安裝 Ruby+Devkit 版本。同時為了防止其他問題，就直接不修改安裝路徑了XD
(但這個時候我的系統硬碟已經快滿了，寸土寸金啊QAQ)

在安裝視窗的最後(Finish那個視窗)，會問你是否執行`ridk install`，這時候就大力地勾下去，再按`Finish`。

接著就會跳出以下畫面，並開始一連串地設定、檢查了(檢查什麼我也不是很清楚，反正這邊無腦安裝。)
![](https://i.imgur.com/k1O08mL.png)

一切執行完後，會顯示以下畫面，

![](https://i.imgur.com/kXjGJvT.png)

此時可以進入`系統內容 > 環境變數`中，確認是否有新增環境變數，如下

![](https://i.imgur.com/KxvJuTv.png)

確定環境變數有添加成功後，開啟一個新的cmd，這樣才會載入新的環境變數，並輸入`gem install jekyll bundler`，用意是為了安裝`jekyll`、`bundler`，如下
![](https://i.imgur.com/8vGmTeA.png)

安裝完成後，輸入`jekyll -v`確認是否有成功安裝 jeykll，如下
![](https://i.imgur.com/al2TvDU.png)

---

# 2. 在 GitHub 中建立一個新的 Repository
因為我的 GitHub 裡面沒有 Repository，所以就像下面這張圖，什麼都沒有～
![](https://i.imgur.com/3PRi2X9.png)

那點選`Create repository`，接著輸入`Repository name`，也可以添加一些描述，
![](https://i.imgur.com/upS3Q1a.png)

接著會跳轉到以下畫面，再點選`Settings`
![](https://i.imgur.com/GbUIHBA.png)

下拉至`GitHub Pages`，並點選`Choose a theme`，讓 GitHub 先替我們透過 jekyll 來建立一個靜態網站。
![](https://i.imgur.com/dzeBxyr.png)

隨便選一個主題試試，我選的是`Minimal`主題，並按下`Select theme`
![](https://i.imgur.com/QWdPBW1.png)

到這邊已經建立好網站的雛型了，一般可透過
https://自己的帳號.github.io/剛剛的repository名稱/
來確認一下自己剛剛建立的網站。

又或者可以回到`Settings > GitHub Pages`的部分，這時候應該會發現此處已經打上綠色勾勾，並且告訴你網站的名稱，如下
![](https://i.imgur.com/OANW1EH.png)

以我為例，我的是
[https://ktinglee.github.io/KTing_Blog/](https://ktinglee.github.io/KTing_Blog/)

內容如下，就是剛剛選的模板～
![](https://i.imgur.com/U2zFN2b.png)

---

# 結語
到此，我們可成功在 Windows 系統安裝 Ruby 以及 jekyll，同時也在 GitHub 中建立一個新的 Repository，這個 Repository 未來將會用來存放所有部落格有關的內容，而如何建立一個有模有樣的部落格，就接著看下一篇文章吧！

---





