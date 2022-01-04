---
title: "如何用 GitHub Pages 建立部落格？ - GitHub Pages x Jekyll x Blog"
date: "2021-12-28"

tags:
    - 利用 GitHub Pages 建立部落格
    - GitHub Pages
    - Jekyll
    - blog

excerpt: "
    GitHub Pages x Jekyll x Blog 首部曲！本系列會說明如何利用 GitHub Pages 建立自己的網站(靜態網站)。
    GitHub Pages 是透過文件維護，不涉及任何資料庫。想親手建立 GitHub Pages 部落格不要錯過！
    "
---

## 本篇重點

- 本系列會說明如何利用 GitHub Pages 建立自己的網站(靜態網站)。
- GitHub Pages 是透過文件維護，不涉及任何資料庫。
- 想要更多花樣，可以學習用 Jekyll 開發自己的專屬的部落格。

## GitHub 與 GitHub Pages

### 什麼是 GitHub？

- 簡單的說，GitHub 是「儲存文件的倉庫」。像之後要發布的部落格文章、配置，都會儲存在 GitHub 上。
- 而這個倉庫可以紀錄不同時間點的文件，例如文章寫到一半可以先丟到 GitHub 上，未來撰寫完畢後再覆蓋原本的文章。這時就有兩份文章記錄(稱為 **commit** 紀錄)。
- 文章紀錄的好處就像存檔、讀檔，哪天覺得文章寫得不好，就可以回溯到自己喜歡的紀錄。

### 什麼是 GitHub Pages？

- GitHub 負責保管文件，而 GitHub Pages 負責架站、將文件視覺化。
- GitHub Pages 會使用 Jekyll 吃「上傳到 GitHub 的文件」來生成靜態網站。
- 參考 [GitHub Pages 官方網站](https://pages.github.com/)，官方影片有說明 GitHub, GitHub Pages, Jekyll 的關係。

### 什麼是 Jeykll？

- 根據 GitHub Pages 的官方影片提到「Jekyll 是一個 Open source，用來將文字文件轉換成靜態網站」。
- 所以，日後只要將 Jekyll 所需的材料 push 到 GitHub 的專案目錄(Repository)，就可以將該專案轉換成靜態網站啦！

## 第一步，建立空的 GitHub Pages

### 建立一個專案目錄(Create a repository)

- 專案目錄必須是 Public。
- 專案目錄名稱必須是 `<username>.github.io`，這邊的 `username` 就是帳號。
- 圖片支援

    ![alt](/assets/images/install-github-pages-blog-1/0.png)

    

### 幫專案目錄選擇主題

- 建立好專案目錄後，點選專案目錄的 **settings > 左側的 pages 欄位，**會進到 GitHub Pages 的配置頁面。
- GitHub Pages 配置頁面基本就是說「Jekyll 要吃哪個 branch」、「生成的網站要用哪個主題」、「有沒有自己的域名要」。
- 圖片支援

    ![alt](/assets/images/install-github-pages-blog-1/1.png)
    

### 前往自己的 GitHub Pages！

- 一段時間後，GitHub Pages 差不多建立好了，這時就可以前往自己剛剛建立的 GitHub Pages 啦！
- 打開網址列，進入 `https://<username>.github.io`，其中，username 就打上自己的帳號。
- 例如我的就是 [https://ktinglee.github.io/](https://ktinglee.github.io/install-my-blog(1)/#2-%E5%9C%A8-github-%E4%B8%AD%E5%BB%BA%E7%AB%8B%E4%B8%80%E5%80%8B%E6%96%B0%E7%9A%84-repository)。
- 圖片支援
    

    ![alt](/assets/images/install-github-pages-blog-1/2.png)
    
    - 仔細閱讀文件內容，會看到「Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site」。
    - 意思是說，每當我們新增、修改、移除檔案，並 push 到專案目錄後，GitHub Pages 都會用 Jekyll 來更新靜態網站。

## 結語

- 恭喜，到這就跨出了「建立 GitHub Pages 部落格」的第一步囉！
- 接下來會介紹如何使用別人的 GitHub Pages 模板，讓部落格充滿更多藝術感、功能。
