---
title: "幫部落格加上 SEO - GitHub Pages x Jekyll x Blog"
date: "2021-12-30"

tags:
    - 利用 GitHub Pages 建立部落格
    - GitHub Pages
    - Jekyll
    - SEO
    - blog

excerpt: "
    GitHub Pages x Jekyll x Blog - SEO 篇第二章！
    已經知道 SEO 的基本概念，接下來就是幫網站加上 SEO 啦！幫 Jekyll 的靜態網站加上 SEO 相當簡單，只需要一個套件即可解決。
    "
---

## 本篇重點

- 介紹怎麼幫 GitHub Pages 加上 SEO。

## 幫 GitHub Pages 加上 SEO

- 辛苦建立了部落格，又努力產出文章，當然不想要自己的心血被網際網路淹沒，接下來就來看怎麼幫自己的 GitHub Pages 部落格做 SEO 吧！
- 主要會用到兩個套件：[jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)、[jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)。
- jekyll-seo-tag 在生成靜態檔案時，就會自動為其加上 SEO 用的 tag, meta 等資訊。
- jekyll-sitemap 則是幫助建立 `sitemap.xml`，該檔案是協助搜尋引擎的爬蟲工具快速解析目標網站。
- 兩個套件的安裝方法一樣，所以寫在一起，如下：
    
    ```yaml
    # 1. 在 Gemfile 中新增安裝動作
    gem 'jekyll-seo-tag'
    gem 'jekyll-sitemap'
    
    # 2. 在 _config.yml 的 plugins 欄位加上套件
    plugins:
      - jekyll-seo-tag
      - jekyll-sitemap
    ```
    

### [**jekyll-seo-tag**](https://github.com/jekyll/jekyll-seo-tag)

- 要讓網頁出現 SEO 資訊，必須在 `<head>` 標籤中，補上 SEO 內容

    ```html
    <head>
      ...
      {％ seo ％}
      ...
    </head>
    ```
    
    > 💡 如果不知道要加在哪個網頁樣板，可以直接全域搜尋樣板的資料夾，找看看哪個樣板有用到 `</head>`。
    
- jekyll-seo-tag 會幫忙新增哪些資訊在 `</head>` 標籤？
    - 主要根據 _config.yml 的全域設置，與頁面的 YAML Front Matter 設置(局部設置)。
    
    ```yaml
    # 例如 _config.yml 的設置如下，以下只寫上部分欄位
    # Site Settings
    title: "KTing's Blog" # 網站的名稱
    locale: "zh-TW" # 自己的地區
    description: "An amazing website." # 網站的描述
    url: "https://ktinglee.github.io" # 自己部落格的網址
    ```
    
    ```yaml
    # 有時候不想用全域設置，則對應頁面的 YAML Front Matter 可以加上自己要顯示的欄位
    # 例如本篇文章想要顯示不同的 SEO 內容
    ---
    title: "利用 GitHub Pages 建立部落格-1"
    date: "2021-12-28"
    excerpt: "GitHub Pages 會使用 Jekyll 吃「上傳到 GitHub 的文件」來生成靜態網站！想親手建立 GitHub Pages 部落格不要錯過！"
    ---
    ```
    
    > 💡 可以利用 [Google 提供的檢測工具](https://search.google.com/test/rich-results)，檢查一下自己網站的 SEO 資訊有哪裡需要改進。
    
- 圖片支援
    
    ![alt](/assets/images/add-jekyll-seo/0.png)
    

### [**jekyll-sitemap**](https://github.com/jekyll/jekyll-sitemap)

- 基本上，該套件只要安裝完成後，產生的靜態檔案中，應該會有一個 `sitemap.xml`。
- 接著進到 `https://<username>.github.io/sitemap.xml` 應該能看到自己的網頁地圖
    - 當然，實際的 URL 跟自己採用的 `baseurl` 會有關係，如果沒有設定，應該能看到。
    
    ![alt](/assets/images/add-jekyll-seo/1.png)
    

## 結語

- 基本上，關於 SEO 的基本套件就這樣，簡單而且容易使用。
- 到這邊可能會疑惑，怎麼好像沒用到 sitemap.xml？那是因為，在改善 SEO 時才會提到他，這邊只是因為要安裝套件，所以一併介紹了。
- 下一篇會介紹如何改善 SEO！