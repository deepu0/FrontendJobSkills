#!/usr/bin/env python3
"""Fail if any onlyfrontendjobs.com URL in this repo is not HTTP 200."""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKIP = {".freebuff", ".git", ".hermes", "dist"}
URL_RE = re.compile(r"https://(?:www\.)?onlyfrontendjobs\.com/[a-zA-Z0-9_/?=&%-]+")


def urls() -> list[str]:
    found: set[str] = set()
    for path in ROOT.rglob("*.md"):
        if any(part in SKIP for part in path.parts):
            continue
        text = path.read_text(errors="ignore")
        for match in URL_RE.findall(text):
            clean = match.rstrip(".,;")
            found.add(clean.split("?")[0])
    return sorted(found)


def status(url: str) -> str:
    result = subprocess.run(
        ["curl", "-sI", "-o", "/dev/null", "-w", "%{http_code}", "-L", "--max-time", "20", url],
        capture_output=True,
        text=True,
        check=False,
    )
    return result.stdout.strip() or "000"


def main() -> int:
    failed = 0
    listed = urls()
    if not listed:
        print("No OFJ URLs found.")
        return 1
    for url in listed:
        code = status(url)
        ok = code == "200"
        print(f"{'OK  ' if ok else 'FAIL'} {code}  {url}")
        if not ok:
            failed += 1
    if failed:
        print(f"{failed} URL(s) are not 200.")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
