const fs = require('fs')
const path = require('path')
const { execSync } = require('child_process')

// 读取版本号
const pubspeca = fs.readFileSync('pubspec.yaml').toString()
const version = pubspeca.split('version:')[1].split('\n')[0].trim()

// 创建或更新 .env 文件
const envPath = path.join(process.cwd(), '.env')
const envContent = `APP_VERSION=${version}\n`
// fs.writeFileSync(envPath, envContent)

// 根据不同平台设置环境变量
const setEnvVar = () => {
    if (process.platform === 'win32') {
        execSync(`SETX APP_VERSION "${version}"`, { stdio: 'inherit' })
    } else {
        // Linux 和 macOS
        const shellType = process.env.SHELL || '/bin/bash'
        const rcFile = shellType.includes('zsh')
            ? '~/.zshrc'
            : '~/.bashrc'

        const command = `
      if ! grep -q "APP_VERSION" ${rcFile}; then
        echo "export APP_VERSION=\\"${version}\\"" >> ${rcFile}
      else
        sed -i.bak "s/export APP_VERSION=.*/export APP_VERSION=\\"${version}\\"/g" ${rcFile}
      fi
      export APP_VERSION="${version}"
    `
        execSync(command, {
            stdio: 'inherit',
            shell: true
        })
    }
}

setEnvVar()