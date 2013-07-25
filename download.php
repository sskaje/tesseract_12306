<?php
/*
$url = 'https://dynamic.12306.cn/otsweb/passCodeAction.do?rand=randp';

for ($i=0; $i<200; $i++) {
    exec("wget --no-check-certificate {$url} -O {$i}.jpg &");
}
 */
for ($i=0; $i<200; $i++) {
#    exec("convert {$i}.jpg td.exp{$i}.tiff");
    echo("/cygdrive/d/Apps/Tesseract/tesseract.exe td.exp{$i}.tiff td.exp{$i} batch.nochop makebox;\n");
}
exit;
for ($i=0; $i<200; $i++) {
    exec("/cygdrive/d/Apps/Tesseract/tesseract.exe td.exp{$i}.tiff td.exp{$i} nobatch box.train");
    exec("/cygdrive/d/Apps/Tesseract/cntraining.exe td.exp{$i}.tr");
}

