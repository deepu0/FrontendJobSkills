#!/usr/bin/env python3
"""Fail if any onlyfrontendjobs.com URL in this repo is not HTTP 200.

API endpoints are checked the way the plugin actually calls them:
- /api/public/jobs gets the documented query params (bare requests 400).
- /api/mcp gets a JSON-RPC initialize POST (it is not a GET endpoint).
HTTP 429 (rate limit) is soft-passed — it means "alive, slow down".
"""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path
from urllib.parse import urlparse

ROOT = Path(__file__).resolve().parent.parent
SKIP = {".freebuff", ".git", ".hermes", "dist"}
URL_RE = re.compile(r"https://(?:www\.)?onlyfrontendjobs\.com/[a-zA-Z0-9_/?=&%-]+")

JOBS_PATH = "/api/public/jobs"
JOBS_PARAMS = "?tech=react&posted_within_days=7"
MCP_PATH = "/api/mcp"
MCP_INIT = (
    '{"jsonrpc":"2.0","id":1,"method":"initialize",'
    '"params":{"protocolVersion":"2025-03-26","capabilities":{},'
    '"clientInfo":{"name":"verify-ofj-links","version":"1.0.0"}}}'
)


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


def status(url: str, method: str) -> str:
    cmd = ["curl", "-s", "-o", "/dev/null", "-w", "%{http_code}", "-L", "--max-time", "20"]
    if method == "HEAD":
        cmd.append("-I")
    elif method == "POST":
        cmd += [
            "-X", "POST",
            "-H", "Content-Type: application/json",
            "-H", "Accept: application/json, text/event-stream",
            "-d", MCP_INIT,
        ]
    cmd.append(url)
    result = subprocess.run(cmd, capture_output=True, text=True, check=False)
    return result.stdout.strip() or "000"


def main() -> int:
    failed = 0
    listed = urls()
    if not listed:
        print("No OFJ URLs found.")
        return 1
    for url in listed:
        path = urlparse(url).path
        method = "HEAD"
        check_url = url
        if path == JOBS_PATH:
            check_url = url + JOBS_PARAMS
        elif path == MCP_PATH:
            method = "POST"
        code = status(check_url, method)
        if code == "429":
            print(f"SKIP {code}  {url} (rate limited)")
            continue
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
