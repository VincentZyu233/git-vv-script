![git-vv-script](https://socialify.git.ci/VincentZyu233/git-vv-script/image?custom_description=%E2%9C%A8+git-vv-scripts+%F0%9F%8E%A8+&custom_language=Shell&description=1&font=Rokkitt&forks=1&issues=1&language=1&logo=https%3A%2F%2Fraw.githubusercontent.com%2Fgist%2FXainey%2Fd5bde7d01dcbac51ac951810e94313aa%2Fraw%2F6c858c46726541b48ddaaebab29c41c07a196394%2FPowerShell.svg&name=1&owner=1&pattern=Overlapping+Hexagons&pulls=1&stargazers=1&theme=Auto)

# git-vv

一个自定义的 Git 可视化命令，输出 5 行彩色日志。

## 安装

### Windows (PowerShell)

1. 打开 PowerShell 配置文件：

```powershell
notepad $PROFILE
```

如果提示文件不存在，先运行：

```powershell
New-Item -Path $PROFILE -Type File -Force
```

2. 将 `git-vv.ps1` 的全部内容复制粘贴到 `$PROFILE` 文件中，保存关闭。

3. 刷新生效：关掉终端重开，或执行：

```powershell
. $PROFILE
```

4. 用法：在任意 Git 仓库目录下输入 `gvv` 即可。

### Linux (Bash)

1. 复制脚本到系统命令目录：

```bash
cp git-vv.sh /usr/local/bin/git-vv
chmod +x /usr/local/bin/git-vv
```

2. 如需简短别名 `gvv`，编辑 `~/.bashrc`：

```bash
echo "alias gvv='git-vv'" >> ~/.bashrc
source ~/.bashrc
```

3. 用法：在任意 Git 仓库目录下输入 `gvv` 或 `git-vv`。
