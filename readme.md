
# Overview

这里包含的一方面主要是是我个人的工作，另一方面是可以公开的。


The experiment work has been published in https://doi.org/10.1186/s12866-017-1107-2



# model


开始用 Mathematica 实现，后来觉得太慢（貌似内存也耗得多），后来改用 R 发现好多了。

整理成 R 包后取名为 `partition-fit` , 后移到专门的 repo 并改名为[bisecpp](https://github.com/dongzhuoer/bisecpp)。

MATLAB 的代码实现了微分方程数值求解的函数，主要是画个示意图 ^[好像是为了感谢一下 MATLAB，实际上 `fit.png` 可能是用 R 画的]。

["Rational design of ‘controller cells’ to manipulate protein and phenotype expression"](http://dx.doi.org/10.1016/j.ymben.2015.04.001)

`mmc3.doc` 是论文的补充材料，里面有很多微分方程和参数取值



# wiki

> iGEM wiki is a fantastic tool to watse life

## motivation

It's so upset to make a small change (maybe some CSS rules), and spend several minutes to see the result. Since you need to click **Edit**, wait, copy to editor, make change, copy back, click ***Save Page*, wait, then wait, wait wait , ... Sometimes you may spend 10 minutes for a single CSS change, especially when the connect is realy bad and/or you page has lots of images.

So I implement this workflow: develop the website locally, after you majority changes finished, upload it to iGEM server.

## Usage

in `wiki/` folder:

```r
source('library.R')

transform_whole(to_local)
transform_whole(to_wiki)
```

## Note

为了本地版能正常浏览图片，`wiki/` 与 `image/` 需位于同一目录下。

## Advanced

- `.local.html` and `.wiki.html` contain common header for other html file, local version and wiki version respectively. In wiki version, all pages' header will be the content of `.wiki.html`. The same for `.local.html`.
- edit function `create_map` which create `map` object to maintain link map. `map[i, 1]` is wiki version of a link and `map[i ,2]` is locall version. This is the **key** point, refresh a page needs merely a instant if you load resource from local, i.e. the most time-consuming part of refreshing a wiki page is to load resource from server (especially iGEM server, it crashes irregularly!)
- that's all, thank you for reading! (maybe you can try `wiki_backup` to backup all pages, it will automatically append datetime to backup folder name)
    
    
## Known issue

Currently, the local version isn't identical to wiki version. There is a seperata `template.menubar.html` in local, but that file is embed in other page in wiki. But this doen't bother me to much. I can still work happily.



# wowslider

I use a software to create widget for display team photos. ^[downloading may need to bypass GFW, but 清华云 `archive/software` contains a copy]

There are some issues that I even need to write an Rscript. So you can image how hard it is to reuse. I would most likely to switch to some command line (more importantly, Linux) tools.

The R code has been abandoned for a long time, basically it embeds the widget into wiki.



------------------
[![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).
