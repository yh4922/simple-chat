const fs = require('fs-extra');
const path = require('path');
const { OpenAI } = require('openai');
const package = require('../package.json');
const child_process = require('child_process');

/// 初始化openai接口  apk key存在环境变量
const client = new OpenAI({});
/// 每次翻译的数量 如果语言包数量太多则分批处理
const NUMBER_TRANSLATIONS_PER_TIME = 20
// 读取原始语言文本
const intl_zh = fs.readJSONSync(path.join('./', package.i18n.entry))
// 读取已有语言包
const langMap = {}
package.i18n.outputLocales.forEach(name => {
  let langData = {}
  try {
    langData = fs.readJSONSync(path.join('./lib/i18n/locale/', name + '.arb'))
  } catch (err) {
    langData = {}
  }
  langMap[name] = langData
})

/// 需要翻译的语言字段
const needTranslation = []
langMap[package.i18n.entryLocale] = langMap[package.i18n.entryLocale] || {} // 防止首次没有
Object.keys(intl_zh).forEach(name => {
  let val1 = intl_zh[name]
  let val2 = langMap[package.i18n.entryLocale][name]
  if (val1 !== val2) {
    needTranslation.push(name) // 不相等说明修改过当前字段 则需要重新翻译
    langMap[package.i18n.entryLocale][name] = val1 // 记录当前值  中文不重复翻译直接复制
  }
})

/// 获取翻译员设定
const promptJsonTranslate = (to) => {
  return `Translate the i18n JSON file from '${package.i18n.entryLocale}' to '${to}' according to the BCP 47 standard
Here are some reference to help with better translation.
---
You can adjust the tone and style based on the cultural connotations and regional differences of certain words. As a translator, you need to translate the original text into a version that meets the standards of accuracy and elegance, and try to keep the translated length consistent with the original.
---
Keep the keys the same as the original file and make sure the output remains a valid i18n JSON file.
Do not include any additional text or explanations outside the JSON object.Start directly with a left brace and end with a right brace.
`
}


// 执行翻译函数
translate()
async function translate() {
  // 按照输出文件循环
  for (let locale of package.i18n.outputLocales) {
    langMap[locale] = langMap[locale] || {}
    // 跳过参照文件
    if (locale !== package.i18n.entryLocale) {
      // 复制
      let need_translation = [...needTranslation]
      // 分批获取
      let first_names = need_translation.splice(0, NUMBER_TRANSLATIONS_PER_TIME)
      while (first_names.length) { // 循环直到获取为空
        let json = {}
        first_names.forEach(e => (json[e] = intl_zh[e]))
        // 执行AI翻译
        let res = await client.chat.completions.create({
          messages: [
            { role: 'system', content: promptJsonTranslate(locale) },
            { role: 'user', content: JSON.stringify(json) },
          ],
          model: package.i18n.modelName,
          temperature: 0,
          top_p: 1
        })

        /// 合并翻译结果
        let resJson = {}
        try {
          resJson = JSON.parse(res.choices[0].message.content)
        } catch (err) {
          console.error('翻译出错已跳过', res.choices[0].message.content)
          resJson = {}
        }
        Object.assign(langMap[locale], resJson)
        console.log('翻译', locale, first_names.length)
        first_names = need_translation.splice(0, NUMBER_TRANSLATIONS_PER_TIME)
      }
    }

    // 翻译完成处理翻译文本
    fs.writeJSONSync(path.join('./lib/i18n/locale/', locale + '.arb'), langMap[locale], { spaces: 2 })
  }
}



/// system
/// Translate the i18n JSON file from {from} to {to} according to the BCP 47 standard
/// Here are some reference to help with better translation.  ---${reference}---
/// Keep the keys the same as the original file and make sure the output remains a valid i18n JSON file.
/// Do not include any additional text or explanations outside the JSON object.Start directly with a left brace and end with a right brace.



// // 读取中文作为翻译的入口
// const entryCode = fs.readFileSync("./lib/i18n/locale/intl_zh.arb")

// // 写入成JSON格式
// fs.writeFileSync("./lib/i18n/locale/intl_zh.json", entryCode)

// // 执行 lobe-i18n
// child_process.execSync("node -v", { stdio: "inherit" })
// child_process.execSync("lobe-i18n", { stdio: "inherit" })

// const files = fs.readdirSync("./lib/i18n/locale")
// for (let name of files) {
//     if (name.endsWith(".arb")) {
//         // 删除
//         fs.unlinkSync(`./lib/i18n/locale/${name}`)
//     } else {
//         // 重命名
//         fs.renameSync(`./lib/i18n/locale/${name}`, `./lib/i18n/locale/${name.replace(".json", ".arb")}`)
//     }
// }

// // 执行 flutter pub run intl_utils:generate
// child_process.execSync("flutter pub run intl_utils:generate", { stdio: "inherit" })
