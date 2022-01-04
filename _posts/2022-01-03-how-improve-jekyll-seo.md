---
title: "改善 SEO 的幾種方法 - GitHub Pages x Jekyll x Blog"
date: "2022-01-03"

tags:
    - 利用 GitHub Pages 建立部落格
    - GitHub Pages
    - Jekyll
    - SEO
    - blog

excerpt: "
    GitHub Pages x Jekyll x Blog - SEO 篇第三章！
    幫部落格加上 SEO 後，還是有一些地方可以改善，最直接的就是 SEO 的資訊，例如關鍵字下得好不好？
    再來是，使用好工具(Google Console, Google Analytics)來幫忙解析網站流量、曝光度，更能知道 SEO 的成效如何！
    "
---

## 本篇重點

- 介紹改善 SEO 的幾種方法。
- 介紹 Google Console, Google Analytics 來了解自己的網站。
- 可以利用 [Lighthouse audits](https://developers.google.com/web/tools/lighthouse/) 來檢查自己的網站效能、顯示等等

## 改善 SEO 的方法

### 1. 把網頁 head 標籤中的 meta 訊息設定好

- 例如 `title`, `description`, `keywords`, `author` 等等。
- 這些東西可以加在網頁(例如文章)的 `YAML Front Matter`。
- 有任何想新增的 `YAML Front Matter` 欄位，也可以加在模板中，如下
    
    ```html
    <!-- 網頁模板 -->
    <head>
    	...
    
    	{％ if page.keywords ％}
    	  <meta name="keywords" content="{{ page.keywords }}">
    	{％ endif ％}
    
    	...
    </head>
    ```
    
- 在 `_config.yml` 中的 SEO 設定可能被 Google 忽略
    - 參考連結：[Jekyll SEO Optimization: What Not To Do](https://www.jungledisk.com/blog/2017/08/11/jekyll-seo-what-not-to-do/)
    - 內文提到 Google search 對重複的 head meta 內容，可能會忽略，或只提供最常被點擊的那個網站。
    - 例如部落格中有好幾個頁面用相同的 head meta，可能只有最常被點擊的頁面會被顯示出來。

### 2. 使用固定連結(Permalink)並將其縮短

- 修改 `_config.yml` 的 Permalink。
    - 預設 permalink 格式為 `/:categories/:year/:month/:day/:title:output_ext`。
    - 但後續若有修改 category，可能導致連結失效，這樣就會降低 SEO。
    - 可以推薦改成 `/blog/:categories/:year/:month/:day/:title:output_ext`。
- `_config.yml` 中的 `permalink` 欄位會預設 permalink 的格式，如果想客製某個頁面的 permalink，可以更改頁面的 `YAML Front Matter`。
    
    ```yaml
    # _config.yml 預設的 permalink
    permalink: /:categories/:year/:month/:day/:title:output_ext
    ```
    
    ```yaml
    # 例如有一篇文章位於 _posts 資料夾，名稱為 2021-12-28-install-github-pages-blog
    # 其 front matter 如下
    
    ---
    title: "利用 GitHub Pages 建立部落格-1"
    date: "2021-12-28"
    categories: "test"
    ---
    ```
    
    ```json
    # 利用 permalink 格式解析，各欄位對應的值為
    {
    	categories: "test"
    	year: 2021
    	month: 12
    	day: 28
    	title: "install-github-pages-blog"
    	output_ext: ".html"
    }
    ```
    
    - 產生出來的連結就是 `test/2021/12/28/install-github-pages-blog-1.html`。
- 採用較短的 `permalink` 格式，有助於改善搜尋引擎的爬取。
    
    ```yaml
    # 例如改成
    ---
    title: "利用 GitHub Pages 建立部落格-1"
    date: "2021-12-28"
    categories: "test"
    permalink: /:categories/:title/
    ---
    ```
    
    - 則上述連結會變成 `test/install-github-pages-blog-1`。

### 3. URL 盡量使用英文

- 英文是廣泛使用的語言。
- 中文的話，會需要 encode，而產生的文字也不容易閱讀。

### 4. 提供 sitemap.xml

- `sitemap.xml` 可以透過 `jekyll-sitemap` 套件產生。

### 5. 提供 **robots.txt**

- `robots.txt` 是給爬蟲機器人看的文件，例如說哪些資源不給爬之類的，可以參考 [wiki](https://zh.wikipedia.org/wiki/Robots.txt)。
- 該文件名稱統一為小寫，必須放在根目錄。
- 如果有安裝 `jekyll-sitemap`，好像會自己建立。
- 該文件大概長得如下：
    
    ```yaml
    ---
    title: robots
    ---
    User-agent: *
    Sitemap: <{{site.production_url}}/sitemap.xml>
    ```
    

### 6. 增強連結強度

- 因為 SEO 的排名，有一部分是根據連結的強度，例如好多篇網頁指向同一個網頁，這樣後者的連結權重就會提高。
- 而內部連結也可以達到類似效果，所以放心在自己的網頁中大量引用自己的網頁連結。
- 同時，也可以多使用社群連結，加強自身網頁的推廣。

## 檢視網站的效能

- 利用 [Lighthouse audits](https://developers.google.com/web/tools/lighthouse/#devtools)。
- 用法看連結的教學，相當簡單。
- 圖片支援
    
    ![alt](/assets/images/how-improve-jekyll-seo/0.png)

## 剖析、了解自己的網站

- [Google Console](https://search.google.com/search-console) 可以看網站的曝光、點擊次數，並且了解哪個關鍵字最容易找到網站。
- [Google Analytics](https://analytics.google.com/analytics) 可以用來監測網頁的流量、哪些網頁獲得比較多的觀看次數等等。
- 但關於這兩個工具的用法，之後再提XD

## 結語

- 以上就是關於 SEO 改善方式的簡述。
- 個人覺得 [Lighthouse audits](https://developers.google.com/web/tools/lighthouse/#devtools) 能提供不少改善的方向。
- Google Console 與 Google Analytics 也不難註冊，有興趣的讀者可以自己嘗試一下。

## 參考連結

**[基于Jekyll Bootstrap的博客SEO优化](http://sw897.github.io/2014/02/20/jekyll-bootstrap-seo/)**

**[How I improved my Jekyll SEO](https://blog.mastykarz.nl/improve-jekyll-seo/)**

**[SEO optimization in a Jekyll static website](https://jsinibardy.com/optimize-seo-jekyll)**