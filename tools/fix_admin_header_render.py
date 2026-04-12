from pathlib import Path
import re


bundle = Path(r"d:\project\java_project\医院管理系统优化\ssmf03um\ssmf03um\src\main\webapp\admin\dist\js\app.64d051d6.js")
text = bundle.read_text(encoding="utf-8")

pattern = r'".*?!=this\.\$storage\.get\("role"\)\?e\("div",\{staticClass:"logout",style:\{color:t\.heads\.headLogoutFontColor,fontSize:t\.heads\.headLogoutFontSize\},on:\{click:t\.onIndexTap\}\},\[t\._v\(".*?"\)\]\):t\._e\(\),e\("div",\{staticClass:"logout",style:\{color:t\.heads\.headLogoutFontColor,fontSize:t\.heads\.headLogoutFontSize\},on:\{click:t\.onLogout\}\},\[t\._v\(".*?"\)\]\)'

replacement = '"\\u7ba1\\u7406\\u5458"!=this.$storage.get("role")?e("div",{staticClass:"logout",style:{color:t.heads.headLogoutFontColor,fontSize:t.heads.headLogoutFontSize},on:{click:t.onIndexTap}},[t._v("\\u9000\\u51fa\\u5230\\u524d\\u53f0")]):t._e(),e("div",{staticClass:"logout",style:{color:t.heads.headLogoutFontColor,fontSize:t.heads.headLogoutFontSize},on:{click:t.onLogout}},[t._v("\\u9000\\u51fa\\u767b\\u5f55")])'

new_text, count = re.subn(pattern, lambda m: replacement, text, count=1, flags=re.S)
if count != 1:
    raise SystemExit(f"expected 1 replacement, got {count}")

bundle.write_text(new_text, encoding="utf-8")
print("fixed header render", bundle)
