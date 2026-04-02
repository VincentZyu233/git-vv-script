function Get-GitOverview {
    # 定义 ANSI 颜色码 (与 Linux 保持一致)
    $Y = "`e[1;33m" # Yellow
    $B = "`e[0;34m" # Blue
    $C = "`e[0;36m" # Cyan
    $NC = "`e[0m"   # Reset

    Write-Host "`n$Y🚀 Repository Overview$NC"
    Write-Host "$B-----------------------------------------$NC"

    Write-Host "🔗 $C`Remotes:$NC"
    # 使用正则给每一行前加两个空格
    (git remote -v) -replace '^', '  '

    Write-Host "`n🌿 $C`Branches:$NC"
    (git branch -vv) -replace '^', '  '

    Write-Host "`n📜 $C`Recent Log (Top 5):$NC"
    # 强制开启颜色并处理缩进
    git log --oneline -5 --graph --color=always | ForEach-Object { "  $_" }

    Write-Host "`n📊 $C`Status Summary:$NC"
    git diff HEAD --stat | ForEach-Object { "  $_" }

    Write-Host "$B-----------------------------------------$NC`n"
}

if (-not (Get-Alias gvv -ErrorAction SilentlyContinue)) {
    Set-Alias -Name gvv -Value Get-GitOverview
}