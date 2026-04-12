from pathlib import Path


bundle = Path(r"d:\project\java_project\医院管理系统优化\ssmf03um\ssmf03um\src\main\webapp\admin\dist\js\app.64d051d6.js")
text = bundle.read_text(encoding="utf-8")

start_anchor = 't._s(this.$storage.get("adminName")))]),'
end_anchor = '])])])},y=[],F='

start = text.find(start_anchor)
if start == -1:
    raise SystemExit("start anchor not found")
start += len(start_anchor)

end = text.find(end_anchor, start)
if end == -1:
    raise SystemExit("end anchor not found")

replacement = '"\\u7ba1\\u7406\\u5458"!=this.$storage.get("role")?e("div",{staticClass:"logout",style:{color:t.heads.headLogoutFontColor,fontSize:t.heads.headLogoutFontSize},on:{click:t.onIndexTap}},[t._v("\\u9000\\u51fa\\u5230\\u524d\\u53f0")]):t._e(),e("div",{staticClass:"logout",style:{color:t.heads.headLogoutFontColor,fontSize:t.heads.headLogoutFontSize},on:{click:t.onLogout}},[t._v("\\u9000\\u51fa\\u767b\\u5f55")])'

text = text[:start] + replacement + text[end:]
bundle.write_text(text, encoding="utf-8")
print("fixed header segment", bundle)
