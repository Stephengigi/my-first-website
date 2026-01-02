# 刷新环境变量以加载 Git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 验证 Git 是否可用
Write-Host "正在检查 Git..." -ForegroundColor Yellow
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "✓ Git 已成功加载！" -ForegroundColor Green
    git --version
} else {
    Write-Host "✗ Git 未找到，尝试手动添加路径..." -ForegroundColor Red
    $env:Path += ";C:\Program Files\Git\cmd"
    if (Get-Command git -ErrorAction SilentlyContinue) {
        Write-Host "✓ Git 已手动加载！" -ForegroundColor Green
        git --version
    } else {
        Write-Host "✗ 仍然无法找到 Git，请检查安装路径" -ForegroundColor Red
    }
}

