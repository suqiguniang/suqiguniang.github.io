---
title: md书写格式
abbrlink: da0b409
date: 2025-09-03 15:26:26
<!-- cover: https://jsd.012700.xyz/gh/jerryc127/CDN@latest/cover/default_bg.png -->
tags:
---
# md书写格式

## Markdown段落
MD的段落为#,从上往下分为六个，分别是#,##,###,####,#####,######,(这只是一般情况，HEXO可不认这个，你就是干到第#######################都没有问题)

## Markdown字体加粗
MD的字体加粗为两个星号+字+两个星号，也就是这样子 **粗体字**
```
**粗体字**
```

## Markdown字体颜色
Markdown也支持变换字体颜色，具体样式如下 <font color=red> 这是红色字 </font>
```
<font color=red> 这是红色字 </font>
```
要更改只需要更改color中的red就好了

## HEXO特殊的隐藏语法
此次需要安装butterfly的tag插件
```
npm install hexo-butterfly-tag-plugins-plus --save
```
这边建议卸载原版插件然后再安装另一个版本
```
npm uninstall hexo-renderer-marked --save
```
```
npm install hexo-renderer-kramed --save
```
在站点配置文件_config.yml或者主题配置文件_config.butterfly.yml中添加
```
# tag-plugins-plus
# see https://akilar.top/posts/615e2dec/
tag_plugins:
  enable: true # 开关
  priority: 5 #过滤器优先权
  issues: false #issues标签依赖注入开关
  link:
    placeholder: /img/link.png #link_card标签默认的图标图片
  CDN:
    anima: https://npm.elemecdn.com/hexo-butterfly-tag-plugins-plus@latest/lib/assets/font-awesome-animation.min.css #动画标签  anima的依赖
    jquery: https://npm.elemecdn.com/jquery@latest/dist/jquery.min.js #issues标签依赖
    issues: https://npm.elemecdn.com/hexo-butterfly-tag-plugins-plus@latest/lib/assets/issues.js #issues标签依赖
    iconfont: //at.alicdn.com/t/font_2032782_8d5kxvn09md.js #参看https://akilar.top/posts/d2ebecef/
    carousel: https://npm.elemecdn.com/hexo-butterfly-tag-plugins-plus@latest/lib/assets/carousel-touch.js
    tag_plugins_css: https://npm.elemecdn.com/hexo-butterfly-tag-plugins-plus@latest/lib/tag_plugins.css
```
然后我们再引用
```
{% psw (这一堆是你要隐藏的字哦~包括括号) %}
```

示例在这啦！  {% psw (这一堆是你要隐藏的字哦~包括括号) %}

## markdown斜体字
markdown的斜体字也很好搞啦，只需要一个就好了
```
*斜体*
```
示例:*斜体*
## markdown表格
markdown的表格语法为
```
|学号|姓名|
|----|----|
|1|张三|
|2|李四|
|3|王五|
```
展现出来就是这个啦
|学号|姓名|
|----|----|
|1|张三|
|2|李四|
|3|王五|
## markdown图片
md的图片也很简单啦，代码是这个
```
md的图片也很简单啦，代码是这个
```
但是这个很不方便，无法调整大小，这个时候就可以使用HTML的语法了，虽然我们说的是MD语法，但是md与html也是互不干扰的啦~
```
<img src="图片链接" width="50%">
```
## markdown代码块格式
md的代码格式为
三个`也就是来渲染，然后后面要带你的代码类型，比如html，最后再以```结束
