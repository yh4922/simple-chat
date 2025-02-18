const fs = require('fs');
const http = require('http');
const url = "http://at.alicdn.com/t/c/font_4831381_vjcw5yu13q.css"

var dartText = `import 'package:flutter/material.dart';

IconData getIcon(int data) {
  return IconData(data, fontFamily: 'iconfont');
}

class Iconfont {`

http.get(url, (res) => {
    let data = '';
    res.on('data', (chunk) => {
        data += chunk;
    });
    res.on('end', () => {
        // 为空
        let arr = data.split('.icon-');
        arr.shift()
        arr.forEach(item => {
            let name = item.split(':')[0];
            let code = "0x" + item.split('"\\')[1].split('";')[0]

            dartText += `\n  // ${name}\n  static IconData get ${name} => getIcon(${code});\n`
        })

        dartText += '}'

        // 写入文件
        fs.writeFileSync('./iconfont.dart', dartText)
    });
});





