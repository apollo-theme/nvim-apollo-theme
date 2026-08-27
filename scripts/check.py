#!/usr/bin/env python3
"""Run all Neovim Apollo repository checks with only the Python standard library."""

from __future__ import annotations

import os
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def run(command: list[str]) -> None:
    print("$ " + shlex.join(command), flush=True)
    subprocess.run(command, cwd=ROOT, check=True, env={**os.environ, "PYTHONDONTWRITEBYTECODE": "1"})


def main() -> int:
    nvim = shutil.which("nvim")
    if nvim is None:
        print("error: nvim is required for the headless colorscheme test", file=sys.stderr)
        return 2

    commands = (
        [sys.executable, "scripts/generate.py", "--check"],
        [sys.executable, "-m", "unittest", "discover", "-s", "tests", "-v"],
        [nvim, "--headless", "--clean", "-u", "NONE", "-l", "tests/headless.lua"],
    )
    try:
        for command in commands:
            run(command)
    except subprocess.CalledProcessError as error:
        return error.returncode
    print("all Neovim Apollo checks passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
