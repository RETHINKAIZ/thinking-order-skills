@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo ==========================================
echo   Thinking Order 系列技能安装器
echo ==========================================
echo.

set "SCRIPT_DIR=%~dp0"
set "PACK_DIR=%SCRIPT_DIR%.."

if "%SKILLS_DIR%"=="" (
    if exist "%USERPROFILE%\.codex\skills" set "SKILLS_DIR=%USERPROFILE%\.codex\skills"
)
if "%SKILLS_DIR%"=="" (
    if exist "%USERPROFILE%\.claude\skills" set "SKILLS_DIR=%USERPROFILE%\.claude\skills"
)
if "%SKILLS_DIR%"=="" (
    if exist "%USERPROFILE%\.cursor\skills" set "SKILLS_DIR=%USERPROFILE%\.cursor\skills"
)
if "%SKILLS_DIR%"=="" set "SKILLS_DIR=%USERPROFILE%\.codex\skills"

echo 正在检查 Agent Skills 目录...
if not exist "%SKILLS_DIR%" (
    echo 未找到 skills 目录，正在创建：%SKILLS_DIR%
    mkdir "%SKILLS_DIR%"
)

echo 使用 skills 目录：%SKILLS_DIR%
echo.

echo 开始安装技能...
echo.

for %%s in (
    thinko-argument-builder
    thinko-article-refiner
    thinko-example-finder
    thinko-idea-spark
    thinko-insight-extractor
    thinko-outline-planner
    thinko-reading-analyzer
    thinko-report-generator
    thinko-rewrite-artist
    thinko-struct-builder
    thinko-style-polisher
    thinko-summary-maker
    thinko-template-writer
    thinko-topic-explorer
) do (
    if exist "%SKILLS_DIR%\%%s" (
        echo    移除旧版入口：%%s
        rmdir /S /Q "%SKILLS_DIR%\%%s"
    )
    if exist "%SKILLS_DIR%\%%s.skill" (
        echo    移除旧版入口：%%s.skill
        del /Q "%SKILLS_DIR%\%%s.skill"
    )
)

set /a SKILL_COUNT=0
for /d %%i in ("%PACK_DIR%\skills\thinko-*") do (
    set "skill_name=%%~nxi"
    echo    安装：!skill_name!
    xcopy "%%i" "%SKILLS_DIR%\!skill_name!\" /E /I /Y
    set /a SKILL_COUNT+=1
)

echo.
echo ==========================================
echo   安装完成！
echo ==========================================
echo.
echo    已安装 %SKILL_COUNT% 个技能
echo.
echo Thinking Order 系列技能列表:
echo.
echo    1. thinko-content-planner       - 内容策划中枢
echo    2. thinko-draft-writer          - 成稿写作中枢
echo    3. thinko-reading-synthesizer   - 阅读综合中枢
echo    4. thinko-editor-polisher       - 编辑润色中枢
echo.
echo 重启你的 agent 或刷新 skills 索引即可使用！
echo.
pause
