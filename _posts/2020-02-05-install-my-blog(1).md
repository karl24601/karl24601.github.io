---
title:  "透過 Jekyll 與 GitHub Pages 建立自己的部落格(1)"
date:   2020-02-05 21:10:42 +0800

tags:
  - jekyll blog
header:
    teaser: https://i.imgur.com/U2zFN2b.png

toc: ture
toc_label: "概覽"
---

> 菜雞時期寫的文章，建議看新的[版本](/install-github-pages-blog-1)。

# 前言
其實自己在大學時，對於編寫程式碼是感到相當害怕的，可能是看到密密麻麻的內容，覺得高深莫測而不敢觸碰。直到進入研究所後，與研究室學長共同執行一項計畫，認識了 matlab，才讓我對程式的敬畏放下了一些。
同時研究室又是做數值模擬，所以非得學習如何編寫程式。

在這段時間我開始使用 HackMD 紀錄自己的研究心得、程式碼等等，最後想說可以分享一些自己的經歷，才發現，原來建立部落格可以透過 GitHub 完成。

以下是透過 Windows 系統，學習如何安裝 jekyll，再到建立專屬自己的部落格。

---

# 1. 在 Windows 系統中安裝 jekyll
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
