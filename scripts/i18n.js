const fs = require('fs');
const path = require('path');
const child_process = require('child_process');

// 读取中文作为翻译的入口
const entryCode = fs.readFileSync("./lib/i18n/locale/intl_zh.arb")

// 写入成JSON格式
fs.writeFileSync("./lib/i18n/locale/intl_zh.json", entryCode)

// 执行 lobe-i18n
child_process.execSync("lobe-i18n", { stdio: "inherit" })

const files = fs.readdirSync("./lib/i18n/locale")
for (let name of files) {
    if (name.endsWith(".arb")) {
        // 删除
        fs.unlinkSync(`./lib/i18n/locale/${name}`)
    } else {
        // 重命名
        fs.renameSync(`./lib/i18n/locale/${name}`, `./lib/i18n/locale/${name.replace(".json", ".arb")}`)
    }
}

// 执行 flutter pub run intl_utils:generate
child_process.execSync("flutter pub run intl_utils:generate", { stdio: "inherit" })
