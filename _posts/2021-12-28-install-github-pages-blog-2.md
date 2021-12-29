---
title: "利用 GitHub Pages 建立部落格-2"
date: "2021-12-28"

tags:
    - 利用 GitHub Pages 建立部落格
    - GitHub Pages
    - Minimal Mistakes
    - Jekyll
    - Jekyll Theme
    - blog

excerpt: "初始化一個 Jekyll 靜態網站，但是好醜...如何套用他人的 Jekyll Theme 呢？ Jekyll, Ruby, Gem？ 要讓部落格變漂亮的朋友不要錯過！"

---

## 本篇重點

- 介紹如何尋他人提供的主題模板(Jekyll Theme)。
- 介紹 Jekyll, Ruby, Gem 的關係，還有各自的用意。
- 介紹如何安裝 Jekyll。
- 利用 Jekyll 初始化預設的靜態網站架構，並觀察與他人的 Jekyll Theme 架構差異。
- 將 Jekyll 預設的靜態網站 push 到 GitHub 部落格專案目錄。

## 估狗一下 Jekyll + GitHub Pages + Theme

- 映入眼簾的應該會有 **[GitHub Pages themes](https://jekyllthemes.io/github-pages-themes)。**這個網站提供許多 **Jekyll Theme**，裡面有免費的也有收費的主題可供使用。
- [Jekyll 官網](https://jekyllrb.com/resources/)也有提供不少主題範例。
- 雖然有免費的主題，但不見得每個都是可以直接使用的，有些在套用上可能還要花費一點心思調整。

## **[Minimal Mistakes](https://jekyllthemes.io/theme/minimal-mistakes)**

- 接下來會以 Minimal Mistakes 這個主題作為部落格的配置。
- 進入 Minimal Mistakes 的展示頁面後，往下拉可以看到該主題被許多使用者採用。點選「**[Get Minimal Mistakes *on GitHub*](https://github.com/mmistakes/minimal-mistakes)**」可以進到該主題的 GitHub 專案目錄。
    
    ![alt](/assets/images/install-github-pages-blog-2/0.png)
    
- 進到該主題的 GitHub 專案目錄後，看到 [Installation](https://github.com/mmistakes/minimal-mistakes#installation) 的部分。有提到三種安裝方式：
    - as a [gem-based theme](https://jekyllrb.com/docs/themes/#understanding-gem-based-themes)
    - as a [remote theme](https://blog.github.com/2017-11-29-use-any-theme-with-github-pages/) (GitHub Pages compatible)
    - or forking/directly copying all of the theme files into your project

### 先備知識

- 在了解上述安裝方式前，先來看一下到底什麼是 **Ruby, gem, Jekyll**！
    - **Ruby**: 一種程式語言。
    - **Jekyll**: 一個**將文件轉換成靜態網站**的工具，利用 Ruby 撰寫的。
    - **gem**: 一個 Ruby 的**套件管理**工具。因為程式開發時，經常要載入不同開發者提供的工具，透過套件管理工具可以增加下載的便利性。
- 那麼，Minimal Mistakes 跟上述三者又有什麼關係呢？
    - Minimal Mistakes 是一個 Jekyll Theme，將 Minimal Mistakes 內容下載到本機後，可以利用 `Jekyll` 把內容架起來(還在本地端)，並用瀏覽器查看架起來的靜態網站。
    - 而 Jekyll 這個工具可以透過 `Ruby` 的套件管理工具 `gem` 取得。
    - 簡單的說，先有 `Ruby` 環境、`gem` 套件管理工具，就可以安裝 `Jekyll`，接著下載 Minimal Mistakes 內容，再用 Jekyll 將其架設。
- 安裝 Ruby 環境、gem 套件管理工具、Jekyll 套件
    - 可以參考 [Jekyll 安裝手冊](https://jekyllrb.com/docs/installation/)。
    - 內容提到至少要先安裝 Ruby, RubyGem, GCC, Make。
    - 然後依照自己的作業系統，選擇適當的安裝方法，最後確認所有內容都有正常安裝。
    
    ```bash
    # 確認是否安裝 Ruby
    $ ruby -v
    
    # 確認是否安裝 Gem
    $ gem -v
    
    # 確認是否安裝 GCC
    $ gcc -v
    $ g++ -v
    
    # 確認是否安裝 Make
    $ make -v
    
    # 確認是否 Jekyll
    $ jekyll -v
    ```
    

### 在套用別人的模板前，先看看 Jekyll Theme 該有的架構

- 1). 建立一個資料夾，並執行 `jekyll new .` 來生成 Jekyll Theme 的基本架構
    
    ```bash
    # 1. 先建立資料夾(例如我在 /tmp 中建立一個名為 blog 的資料夾)
    $ mkdir /tmp/blog
    
    # 2. 進到 /tmp/blog 資料夾
    $ cd /tmp/blog
    
    # 3. 執行 jekyll new . 產生 Jekyll Theme 的基本架構
    $ jekyll new .
    
    # 4. 觀察產生了哪些檔案
    $ ls
    ```
    
    ```bash
    # 產生的檔案
    -rw-r--r--    1 root     root    444 Dec 28 03:35 404.html
    -rw-r--r--    1 root     root   1150 Dec 28 03:36 Gemfile
    -rw-r--r--    1 root     root   1906 Dec 28 03:36 Gemfile.lock
    -rw-r--r--    1 root     root   2135 Dec 28 03:35 _config.yml
    drwxr-xr-x    2 root     root   4096 Dec 28 03:35 _posts
    drwxr-xr-x    5 root     root   4096 Dec 28 03:36 _site
    -rw-r--r--    1 root     root    557 Dec 28 03:35 about.markdown
    -rw-r--r--    1 root     root    181 Dec 28 03:35 index.markdown
    ```
    
    - 看不懂沒關係，可以到 [Jekyll Theme 官方網站](https://jekyllrb.com/docs/themes/)查看。
- 2). 如果想看這個 Jekyll 產生的靜態網站，可以執行 `bundle exec jekyll serve --trace`，或是執行 `bundle exec jekyll serve --livereload --host 0.0.0.0`
    
    ```bash
    # 正常運作的結果
    Configuration file: /tmp/blog/_config.yml
                Source: /tmp/blog
           Destination: /tmp/blog/_site
     Incremental build: disabled. Enable with --incremental
          Generating...
           Jekyll Feed: Generating feed for posts
                        done in 0.352 seconds.
     Auto-regeneration: enabled for '/tmp/blog'
        **Server address: http://127.0.0.1:4000/**
      **Server running... press ctrl-c to stop**.
    ```
    
    ```bash
    # 若是執行 bundle exec jekyll serve --livereload --host 0.0.0.0
    Configuration file: /usr/src/blog/_config.yml
                Source: /usr/src/blog
           Destination: /usr/src/blog/_site
     Incremental build: disabled. Enable with --incremental
          Generating...
           Jekyll Feed: Generating feed for posts
                        done in 0.396 seconds.
     Auto-regeneration: enabled for '/usr/src/blog'
    ***LiveReload address: http://0.0.0.0:35729***
        ***Server address: http://0.0.0.0:4000/***
      Server running... press ctrl-c to stop.
    ```
    
    - 看到 Server address，可以開啟瀏覽器，並到 [http://127.0.0.1:4000/](http://127.0.0.1:4000/) 查看網站畫面。
    
    ***webrick 的錯誤處理***
    
    ```bash
    $ bundle exec jekyll serve --trace
    
    # webrick 錯誤內容
    Configuration file: /tmp/blog/_config.yml
                Source: /tmp/blog
           Destination: /tmp/blog/_site
     Incremental build: disabled. Enable with --incremental
          Generating...
           Jekyll Feed: Generating feed for posts
                        done in 0.366 seconds.
     Auto-regeneration: enabled for '/tmp/blog'
    **bundler: failed to load command: jekyll** (/usr/local/bundle/bin/jekyll)
    /usr/local/bundle/gems/jekyll-4.2.1/lib/jekyll/commands/serve/servlet.rb:3:in `require': ***cannot load such file -- webrick (LoadError)***
    
    ... 下略
    ```
    
    - 依照 [Jekyll 官網的 Quick Start](https://jekyllrb.com/docs/) 頁面，有一個提示說到「如果 Ruby 版本高於 3.0.0，可能要先執行 `bundle add webrick`」
    - 所以，若遇到上述錯誤「cannot load such file -- webrick (LoadError)」，可以先執行 `bundle add webrick`，再執行 `bundle exec jekyll serve --trace`。
- 3). 把這個資料夾的內容 push 到 GitHub 的部落格專案吧(這邊就用最簡單的拖拉方式)！
    1. 進到 GitHub 部落格專案目錄，點選 Upload files
        
        ![alt](/assets/images/install-github-pages-blog-2/1.png)
        
    2. 把資料夾中的檔案全部拖拉到網頁中
    3. 填寫本次提交(commit)原因，這步驟很重要，方便未來回顧、除錯
        
        ![alt](/assets/images/install-github-pages-blog-2/2.png)
        
    4. 最後專案目錄應該要長得跟下圖差不多
        
        ![alt](/assets/images/install-github-pages-blog-2/3.png)
        
    5. **過幾分鐘**後，再到 [`https://<username>.github.io/`](https://wulonglongggggggggg.github.io/) 查看，應該會變成預設的 Jekyll 歡迎頁面
- `jekyll new` 的靜態網站畫面支援
    
    ![alt](/assets/images/install-github-pages-blog-2/4.png)
    
    - 可以點選圖中的「Welcome to Jekyll!」，會跳到 `jekyll new` 產生的預設文章。
    - 該文章的內容可以到第一步驟的資料夾查看，應該能在 `_posts` 資料夾看到。
    

### 複製 Minimal Mistakes 專案

- 有了基本知識後，接下來將 Minimal Mistakes 的專案下載到本機，並利用 Jekyll 執行之。
- 1). 進到 Minimal Mistakes 專案目錄後，看是要用 Git 的 GUI 介面(GitHub Desktop 或SourceTree)，或是要直接下載 Zip 檔。
    
    ![alt](/assets/images/install-github-pages-blog-2/5.png)
    
- 2). 將 Zip 檔解壓縮，比較一下 Minimal Mistakes 跟預設的 Theme 架構差異
    
    ```bash
    Default              Minimal Mistakes
    ----------------------------------------
    404.html             CHANGELOG.md
    Gemfile              Gemfile
    Gemfile.lock         LICENSE
    _config.yml          _config.yml
    _posts               Rakefile
    _site                README.md
    about.markdown       _data
    index.markdown       _includes
                         _layouts
                         _sass
                         assets
                         banner.js
                         docs
                         index.html
                         minimal-mistakes-jekyll.gemspec
                         package-lock.json
                         package.json
                         screenshot-layouts.png
                         screenshot.png
                         staticman.yml
                         test
    ```
    
    - 可以看出 Minimal Mistakes 跟預設的 Jekyll Theme 有很大的差異。


> 💡 之所以要下載到本機是為了在本機先查看網站狀況是否正常，若一切沒問題才會將結果 push 到 GitHub 的專案目錄。就像推出一個新產品或新版本時，會先在開發環境確認一切是否正常才真正推出到客戶手上。

## 結語

- Jekyll 是用來將文件轉換成靜態網站的工具，只要資料夾中的檔案、架構符合 Jekyll 的格式，就能將其轉換成靜態網站，並在瀏覽器中查看。
- GitHub Pages 會吃 GitHub 中的資料，只要資料、格式符合 Jekyll 能吃的，就可以在 [`https://<username>.github.io/`](https://wulonglongggggggggg.github.io/) 中看到對應的結果(不過要等個 1, 2分鐘)。
- 本篇雖然有下載 Minimal Mistakes，但並沒有將其建構起來，只能單純看該主題的資料格式(雖然也沒特別介紹XD)
- 下一篇會介紹如何用 `jekyll` 將 Minimal Mistakes 跑起來，然後在瀏覽器中看到該主題！

## 參考連結

- [GitHub Pages 的官方文件](https://docs.github.com/en/pages)，如果想要從無到有慢慢配置可以參考～
- [Jekyll 官方網站](https://jekyllrb.com/)，想更瞭解 Jekyll 可以點進去
