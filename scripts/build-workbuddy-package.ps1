$ErrorActionPreference = 'Stop'

$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$sourcePath = Join-Path $projectRoot 'skills\hr-greeting\SKILL.md'
$packageDir = Join-Path $projectRoot 'packages'
$outputPath = Join-Path $packageDir 'hr-greeting-workbuddy.zip'
$source = Get-Content -LiteralPath $sourcePath -Raw -Encoding UTF8
$frontmatterPattern = '(?s)\A---\r?\n.*?\r?\n---\r?\n'
if ($source -notmatch $frontmatterPattern) { throw 'Source skill has no YAML frontmatter.' }

$workBuddyFrontmatter = @'
---
name: hr-greeting
display_name: 岗位评估与打招呼
display_name_en: HR Greeting
description: Analyze a Chinese job listing against a resume and draft an evidence-based recruiter greeting.
description_zh: 核实岗位、分析简历匹配与缺口，并撰写招聘平台打招呼草稿。
description_en: Check a job listing, assess resume fit and gaps, and draft a recruiter greeting.
version: 1.0.1
author: liacc339
---
'@

$body = [regex]::Replace($source, $frontmatterPattern, '', 1)
$staging = Join-Path ([System.IO.Path]::GetTempPath()) ('hr-greeting-workbuddy-' + [guid]::NewGuid().ToString('N'))
try {
    $skillDir = Join-Path $staging 'hr-greeting'
    New-Item -ItemType Directory -Path $skillDir -Force | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $skillDir 'SKILL.md'), $workBuddyFrontmatter + "`n" + $body, [System.Text.UTF8Encoding]::new($false))
    New-Item -ItemType Directory -Path $packageDir -Force | Out-Null
    if (Test-Path -LiteralPath $outputPath) { Remove-Item -LiteralPath $outputPath }
    Compress-Archive -LiteralPath $skillDir -DestinationPath $outputPath
    Write-Output $outputPath
}
finally {
    if (Test-Path -LiteralPath $staging) { Remove-Item -LiteralPath $staging -Recurse -Force }
}
