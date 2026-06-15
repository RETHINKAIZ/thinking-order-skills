@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul

echo ==========================================
echo   Thinking Order 系列技能安装器 v1.1.0
echo ==========================================
echo.

set "SCRIPT_DIR=%~dp0"
set "PACK_DIR=%SCRIPT_DIR%.."
if "%SKILLS_DIR%"=="" set "SKILLS_DIR=%USERPROFILE%\.claude\skills"

echo 正在检查 skills 目录...
if not exist "%SKILLS_DIR%" (
    echo 未找到 skills 目录，正在创建：%SKILLS_DIR%
    mkdir "%SKILLS_DIR%"
)

echo 成功检测到 skills 目录：%SKILLS_DIR%
echo.

echo 开始安装技能...
echo.

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
echo    1. thinko-writing-planner      - 写作策划师
echo    2. thinko-structure-writer     - 结构成稿师
echo    3. thinko-reading-synthesizer  - 阅读洞察官
echo    4. thinko-revision-polisher    - 改写润色师
echo.
echo 重启对应 agent/runtime 即可使用！
echo.
pause
