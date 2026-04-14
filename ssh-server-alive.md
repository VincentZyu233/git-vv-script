## SSH Server Alive

### Windows Powershell
```
nano $PROFILE
```
然后，以下的文本放到 `$PROFILE`
```powershell
function sshsa {
    param(
        [Parameter(Mandatory=$false, Position=0)]
        [string]$Target,
        
        [Parameter(Mandatory=$false, Position=1)]
        [int]$Port = 22
    )

    # 检查是否请求帮助
    if ($Target -eq "-h" -or $Target -eq "--help" -or [string]::IsNullOrEmpty($Target)) {
        Write-Host "`nUsage: sshsa <user@host> [port]" -ForegroundColor Yellow
        Write-Host "Example: sshsa root@1.1.1.1 2222"
        Write-Host "Options: Defaults to port 22 if not specified. Includes 60s keep-alive.`n"
        return
    }

    # 执行 SSH
    ssh -p $Port -o ServerAliveInterval=60 -o ServerAliveCountMax=3 $Target
}
```
然后：
```powershell
. $PROFILE
sshsa --help
```

### Linux Bash
```bash
nano ~/.bashrc
```
然后，以下的文本放到 `~/.bashrc`
```bash
sshsa() {
    # 检查帮助参数或空参数
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ -z "$1" ]]; then
        echo -e "\nUsage:  sshsa <user@host> [port]"
        echo -e "Example: sshsa root@1.1.1.1 2222"
        echo -e "Note:    Defaults to port 22. Sends heartbeats every 60s.\n"
        return 0
    fi

    local TARGET=$1
    local PORT=${2:-22}

    echo "Connecting to $TARGET on port $PORT with keep-alive..."
    ssh -p "$PORT" -o ServerAliveInterval=60 -o ServerAliveCountMax=3 "$TARGET"
}
```
然后：
```bash
. ~/.bashrc
sshsa --help
```