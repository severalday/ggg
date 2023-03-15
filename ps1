# 配置 Putty 的 sftp.exe 路径和服务器信息
$sftpPath = "C:\Program Files\PuTTY\sftp.exe"
$serverAddress = "example.com"
$username = "your_username"
$password = "your_password"

# 指定要上传的本地文件夹路径
$localPath = "C:\path\to\folder"

# 获取所有子文件夹和文件的路径
$filePaths = Get-ChildItem -Path $localPath -Recurse | Select-Object -ExpandProperty FullName

# 循环遍历所有路径，使用 sftp.exe 上传到服务器
foreach ($filePath in $filePaths) {
    $sftpCommand = "put `"${filePath}`" `"${filePath}`""
    & $sftpPath -batch -pw $password $username@$serverAddress $sftpCommand
}
