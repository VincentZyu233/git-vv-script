#!/usr/bin/env python3
import subprocess
import sys


def run(cmd):
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout


def main():
    print("\n🚀 Repository Overview")
    print("-----------------------------------------")

    print("\n🔗 Remotes:")
    print("  " + run("git remote -v").strip().replace("\n", "\n  "))

    print("\n🌿 Branches:")
    print("  " + run("git branch -vv").strip().replace("\n", "\n  "))

    print("\n📜 Recent Log (Top 5):")
    print(
        "  "
        + run("git log --oneline -5 --graph --color=always")
        .strip()
        .replace("\n", "\n  ")
    )

    print("\n📊 Status Summary:")
    print("  " + run("git diff HEAD --stat").strip().replace("\n", "\n  "))

    print("-----------------------------------------\n")


if __name__ == "__main__":
    main()
