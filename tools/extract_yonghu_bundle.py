from pathlib import Path


bundle = Path("src/main/webapp/admin/dist/js/app.64d051d6.js")
text = bundle.read_text(encoding="utf-8")

targets = {
    "yonghu_info_method": 'info:function(t){var e=this;this.$http({url:"yonghu/info/".concat(t),method:"get"})',
    "yonghu_page_method": 'this.$http({url:"yonghu/page",method:"get",params:l})',
    "yonghu_session": 'this.$http({url:"".concat(this.$storage.get("sessionTable"),"/session"),method:"get"})',
}

out_dir = Path("tools/bundle_extracts")
out_dir.mkdir(parents=True, exist_ok=True)

for name, target in targets.items():
    idx = text.find(target)
    snippet = text[max(0, idx - 3000):min(len(text), idx + 5000)] if idx != -1 else ""
    (out_dir / f"{name}.txt").write_text(f"index={idx}\n\n{snippet}", encoding="utf-8")
    print(name, idx)
