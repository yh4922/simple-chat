const fs = require('fs')
const path = require('path')
const pubspeca = fs.readFileSync('pubspec.yaml').toString()
var envContent = ""

// 读取版本号
const version = pubspeca.split('version:')[1].split('\n')[0].trim()
const versionName = version.split('+')[0]
const versionNumber = version.split('+')[1] || version.split('+')[0]
envContent += `APP_VERSION=${version}\n`
envContent += `APP_VERSION_NAME=${versionName}\n`
envContent += `APP_VERSION_NUMBER=${versionNumber}\n`

// 写入环境变量
const envPath = path.join(process.cwd(), '.env')
fs.writeFileSync(envPath, envContent)