tesseract_12306
===============

Tesseract training script for 12306

Author: sskaje ([http://sskaje.me/](http://sskaje.me/))


参考download.php下载图片，转成tiff，然后makebox

找个box编辑工具，人肉修正字符，明显有残缺的验证码请直接放弃

然后再执行build.sh，完了试用tessadata看看效果

更多的。。。我也不记得了。。。上次搞这个都快两年了

之前测试的时候，我是人肉再下一批图片，保存成 12306.xxxx.jpg，用训练的文件测试，把结果保存起来比对异常的，windows下命令参考
```
tesseract 12306.24RS.jpg 111 -l 12306 && echo 24RS  >> 1.txt && type 111.txt >> 1.txt && echo - >> 1.txt
```
