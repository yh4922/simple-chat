const fs = require('fs');
const http = require('http');
const url = "http://at.alicdn.com/t/c/font_4831381_gnpazxza9h.css"

// node .\lib\widgets\iconfont\gen.js

var dartText = `import 'package:flutter/material.dart';

class Iconfont {`

http.get(url, (res) => {
    let data = '';
    res.on('data', (chunk) => {
        data += chunk;
    });
    res.on('end', () => {
        // 为空
        let arr = data.split('.icon-');

        // 头部
        let headArr = arr.shift().split("url('")
        headArr.shift()
        let ttfUrl = ""
        headArr.forEach(item => {
            if (item.includes("') format('")) {
                ttfUrl = "http:" + item.split("') format('")[0]
            }
        })
        console.log(ttfUrl)
        downloadTtf(ttfUrl)

        arr.forEach(item => {
            let name = item.split(':')[0];
            let code = "0x" + item.split('"\\')[1].split('";')[0]
            dartText += `\n  /// ${name}`
            dartText += `\n  // ignore: non_constant_identifier_names`
            dartText += `\n  static IconData get ${name} => const IconData(${code}, fontFamily: 'iconfont');\n`
        })

        dartText += '}'

        // 写入文件
        fs.writeFileSync('./lib/widgets/iconfont/iconfont.dart', dartText)
    });
});




function downloadTtf(url) {
    try {
        fs.unlinkSync('./fonts/iconfont.ttf')
    } catch (err) { }

    http.get(url, (res) => {
        res.pipe(fs.createWriteStream('./fonts/iconfont.ttf'))
    })
}

