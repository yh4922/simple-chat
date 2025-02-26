const fs = require('fs')
const path = require('path')
// const { execSync } = require('child_process')

// 读取版本号
const pubspeca = fs.readFileSync('pubspec.yaml').toString()
const version = pubspeca.split('version:')[1].split('\n')[0].trim()

// 创建或更新 .env 文件
const envPath = path.join(process.cwd(), '.env')
const envContent = `APP_VERSION=${version}\n`
fs.writeFileSync(envPath, envContent)