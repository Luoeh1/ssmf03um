from pathlib import Path
import re


bundle = Path(r"d:\project\java_project\医院管理系统优化\ssmf03um\ssmf03um\src\main\webapp\admin\dist\js\app.64d051d6.js")
s = bundle.read_text(encoding="utf-8")

mods = [m.start() for m in re.finditer(r'new a\.a\(\{id:"icon-', s)]
print("module_count", len(mods))

bad = []
for m in re.finditer(r',use:"icon-', s):
    pos = m.start()
    prev = s[pos - 1] if pos > 0 else ""
    if prev != '"':
        start = max(0, pos - 180)
        end = min(len(s), pos + 220)
        bad.append((pos, prev, s[start:end]))

print("bad_count", len(bad))
for pos, prev, seg in bad[:20]:
    print("BAD", pos, "prev=", repr(prev))
    print(seg.encode("unicode_escape").decode("ascii"))
    print("---")
