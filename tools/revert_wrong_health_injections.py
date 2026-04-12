from pathlib import Path


bundle = Path("src/main/webapp/admin/dist/js/app.64d051d6.js")
text = bundle.read_text(encoding="utf-8")

needle = 'methods:{getHealthArchiveSections:function'
tail = 'download:function(t){window.open("".concat(t))},init:function(t,e){'

for _ in range(2):
    start = text.find(needle)
    if start == -1:
        raise SystemExit("no more injected methods found")
    end = text.find(tail, start)
    if end == -1:
        raise SystemExit("missing injected tail")
    text = text[:start] + 'methods:{' + text[end:]

bundle.write_text(text, encoding="utf-8")
print("reverted wrong injections", bundle)
