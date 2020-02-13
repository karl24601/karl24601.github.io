---
title:  "透過 Jekyll 與 GitHub Pages 建立自己的部落格(2)"
date:   2020-02-12 23:12:42 +0800

tags:
  - jekyll blog
header:
    teaser: https://i.imgur.com/8tZW7rQ.png

toc: ture
toc_label: "概覽"
---

# 前言
在上一篇，提到如何在 Windows 系統安裝 Ruby 以及 jekyll，並且透過 GitHub 建立一個存放部落格內容的 repository，同時選擇部落格的基本模板。
而本篇將會介紹如何打造個人化的部落格，並且發一篇文章～

---

# 改造從模仿開始 - minimal mistakes
學習最簡單的入門方式就是"模仿"，只要在 Google 上搜尋 `jekyll theme` 就可以找到許多模板可以使用。
在上一篇中，我們以 `jekyll new` 建立部落格的基本架構，但整個網站相當簡陋。

***而要將它變成自己的形狀還滿複雜的***，對於初次建立部落格的人而言真的太困難，因此我們就直接撿現成的，再慢慢修改它。

以自己為例，在找了許多主題後，最後選擇的是 [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) 的模板作為部落格外觀。

---

# 複製 Minimal Mistakes Theme

## 1. 首先 `fork` minimal mistakes 官方的 repo 至自己的 GitHub，並修改 Settings
* [minimal-mistakes 專案連結可點我](https://github.com/mmistakes/minimal-mistakes)。

![](https://i.imgur.com/uayt7tO.png)

點一下 `Fork` 後，就可以在自己的 GitHub 中看到這個 repo 啦～
![](https://i.imgur.com/slQ7sR2.png)

然後進入到 `Settings`，修改一下 `Repository name` 與 `GitHub Pages` 區塊。其中，將 `Repository name` 要改成 `自己的帳號.github.io`，將 `Source` 設定為 `master`。如下：

![](https://i.imgur.com/k6owNnb.png)
*修改Repo名稱*{: style="color: gray; font-size: 80%"}  
{: .text-center}
![](https://i.imgur.com/RE5a56t.png)
*修改分支*{: style="color: gray; font-size: 80%"}  
{: .text-center}

> 這樣命名方式的原因可以參考 [About GitHub](https://help.github.com/en/github/working-with-github-pages/about-github-pages)。


## 2. 將 Fork 的 repo 拷貝至電腦硬碟
接下來我們要修改 minimal-mistakes 的內容，打造成專屬自己的部落格，而比較安全的做法就是，「把它拷貝至電腦，於電腦中修改，修改完成後再上傳回 GitHub」。
如此也可以順便學習如何使用 `Git`。

這邊我用的是 `GitHub Desktop`(當然也可以用終端機，但圖形化介面比較適合入門，例如 Sourcetree 也不錯)。

在做修改的同時，可以參考 [Minimal-Mistakes官方教學](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)。

拷貝 repository 的過程相當簡單，說明如下圖，別忘了要選擇拷貝路徑。
![](https://i.imgur.com/8tZW7rQ.png)

## 3. 修改內容
接著，跟著 [Minimal-Mistakes官方教學](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)，因為我們是要透過 GitHub Pages 架設部落格，所以看到 **Remote theme methodPermalink** 的章節。

### 3-1. 修改 `Gemfile` 內容，如下：
clone 下來的 `Gemfile` 只有兩行，而官方教學的我自己讀得也不是很清楚(不確定是不是我英文差QAQ)，總之我是參考前一篇 [建立部落格初體驗(1)](https://ktinglee.github.io/install-my-blog(1)/) 裡面的 `Gemfile` 做修改的～

修改結果如下：
```yaml
source "https://rubygems.org"
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

# gem "jekyll", "~> 4.0.0"

# This is the default theme for new Jekyll sites. You may change this to anything you like.
# gem "minima", "~> 2.5"
# gem "minimal-mistakes-jekyll"

# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins

# If you have any plugins, put them here!
# 此處就看 _config.yml 的 plugins 有哪些就加入哪些～
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-gist"
  # gem "jekyll-feed"
  gem "jekyll-include-cache"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?

```

### 3-2. 於 `_config.yml` 文件的 `plugins`陣列 中，添加以下內容
```yaml
jekyll-include-cache
```

接著，在 `_config.yml` 文件的 `remote_theme` 與 `repository` 輸入新的內容。如下：
```yaml
# remote_theme 的部分，依照官方教學所說的，輸入
remote_theme: "mmistakes/minimal-mistakes@4.18.1"

# repository 則須按照自己的 GitHub 做改變，其格式為
# 你的GitHub帳號/剛剛clone至電腦的專案名稱 以我自己為例，我的 repository 欄位要填入
repository: KTingLee/KTingLee.github.io
```

### 3-3. 於 `_config.yml` 文件中，修改基本設置
於 `_config.yml` 文件裡，可以看到許多設置，例如 Site Settings、Social Sharing、Site Author、Site Footer 等。

而我們可以先修改 Site Settings 與 Site Author 的部分。

例如我的配置如下：

#### * Site Settings
```shell
locale                   : "zh-TW"  # 自己的地區
title                    : "KTing's Blog"  # 網站的名稱
title_separator          : "-"
subtitle                 : "記錄、分享成長過程" # 子標題，位於網站名稱下方
name                     : "KTingLee"
description              : "An amazing website."
url                      : # the base hostname & protocol for your site e.g. "https://mmistakes.github.io"
baseurl                  : # the subpath of your site, e.g. "/blog"
repository               : "KTingLee/KTingLee.github.io" # GitHub username/repo-name e.g. "mmistakes/minimal-mistakes"
```

#### * Site Author
```shell
author:
  name             : "KTingLee"
  avatar           : # path of avatar image, e.g. "/assets/images/bio-photo.jpg"
  bio              : "Fake it until you can make it."
  location         : "Taiwan"
```

### 3-4. 移除不必要的檔案
根據官方教學，若我們直接 fork minimal-mistakes，則可以移除以下檔案
* .editorconfig
* .gitattributes
* .github
* docs
* test
* CHANGELOG.md
* minimal-mistakes-jekyll.gemspec
* README.md
* screenshot-layouts.png

所以開啟終端機，並進入 clone 下來的資料夾位置，並執行以下指令(此處我用的是 Windows，Mac 用了是會報錯哦)
```shell
# 移除檔案用 del，/s 是連同子目錄刪除，也可以加 /q，可以忽略cmd提示
del /s .editorconfig .gitattributes CHANGELOG.md minimal-mistakes-jekyll.gemspec README.md screenshot-layouts.png

# 移除文件用 rd
rd /s  docs test .github
```

### 3-5. 同步並更新
接著執行
```python
bundle install
```
![](https://i.imgur.com/LSRUQZv.png)

### 3-6. 檢查部落格吧！
最後，我們執行以下指令，以便瞭解我們的部落格現在長得怎麼樣吧！
```python
bundle exec jekyll serve
```
\-
結果如下，
![](https://i.imgur.com/9wGwXBm.png)

打開瀏覽器，並於網址列中輸入 `Server address` 的內容，http://127.0.0.1:4000/

網頁內容如下，看起來空蕩蕩的，那因為我們還沒新增文章，。
![](https://i.imgur.com/goZTXzu.png)

## 4. 趕快丟一篇文章吧！
透過 jekyll 建立的部落格，其網站配置會放在 `_config.yml`，而文章會放在 `_post` 中，而文章將按照其一定格式建立，其格式如下：
```yaml
# 文件名稱格式
yyyy-mm-dd-TITLE.markdown

# 文件內容格式範例
---
layout: post
title:  "標題"
date:   yyyy-mm-dd HH:MM:SS GMT # 以台灣為例，GMT就改成 +0800
categories: 分類
---
我今天透過 GitHub Pages 建立了個人部落格，而部落格是透過 jekyll 生成的，主要參考的 jekyll 主題是 minimal-mistakes。

而這是我第一篇部落格文章。
```

所以我們在部落格資料夾下先建立 `_post` 資料夾，並在 `_post` 內新增一個文件，指令如下：
```shell
mkdir _post
cd _post
```

接著新增一個文字檔，命名如下：
```
2020-02-04-welcome-to-jekyll.markdown
```

並貼上內容，例如：
```shell
---
layout: post
title:  "Welcome to Jekyll!"
date:   2020-02-04 13:46:42 +0800
categories: jekyll update
---
我今天透過 GitHub Pages 建立了個人部落格，而部落格是透過 jekyll 生成的，主要參考的 jekyll 主題是 minimal-mistakes。

而這是我第一篇部落格文章。
```

儲存後，重新整理剛剛的頁面，就可以看到文章啦！如下：
![](https://i.imgur.com/YO9DUzU.png)

---

# 最後一步，上傳至 GitHub
到這邊，我們大致修改了部落格的基本資料，並發布一篇文章，但這些內容只存在於自己的電腦中，我們必須將這些更動上傳至 GitHub，才算完成工作哦！

那這邊就不對 Git 的操作多做贅述了，就是 `add` 後，進行 `commit`，再 `push` 至 GitHub repository (但我是用圖形化介面啦)。

> 上傳成功後，可以透過
> http://USERNAME.github.io
> 瀏覽自己的部落格。
> 
> 例如我的是
> http://KTingLee.github.io

---

# 結語
前一篇介紹如何透過 GitHub Pages 建立個人的部落格，只是相當簡陋，而本篇則是介紹如何使用他人的部落格配置。
關於部落格的配置還有許多部份可以摸索，等我瞭解更深入後應該會再開新一篇文章，希望我的部落格建立筆記對觀看文章得你有幫助，若是有什麼需要補充得也可以再下面留言讓我知道哦～






