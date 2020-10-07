﻿$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName    = 'dub'
  FileFullPath = "$toolsPath\dub-v1.20.0-windows-windows-i686.zip"
  FileFullPath64 = "$toolsPath\dub-v1.20.0-windows-windows-x86_64.zip"
  Destination    = $toolsPath

  Url32            = 'https://github.com//dlang/dub/releases/download/v1.23.0/dub-v1.23.0-windows-x86_64.zip'
  Url64            = 'https://github.com//dlang/dub/releases/download/v1.23.0/dub-v1.23.0-windows-x86_64.zip'
}

Get-ChildItem $toolsPath\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
Install-ChocolateyZipPackage @packageArgs
Remove-Item $toolsPath\*.zip -ea 0 -Force
