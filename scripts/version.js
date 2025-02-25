// 读取pubspec.yaml文件中的版本号 写入环境变量
const fs = require('fs')
const pubspeca = fs.readFileSync('pubspec.yaml').toString()
const version = pubspeca.split('version:')[1].split('\n')[0].trim()
fs.writeFileSync('.env', "APP_VERSION=" + version)