@echo off
chcp 65001 >nul

echo ==========================================
echo   Thinking Order 系列技能安装器
echo ==========================================
echo.

set "SCRIPT_DIR=%~dp0"
set "PACK_DIR=%SCRIPT_DIR%.."
set "SKILLS_DIR=%USERPROFILE%\.claude\skills"

echo 正在检查 Claude Code skills 目录...
if not exist "%SKILLS_DIR%" (
    echo 错误：未找到 Claude Code skills 目录
    echo    请确保已安装 Claude Code
    pause
    exit /b 1
)

echo 成功检测到 Claude Code skills 目录：%SKILLS_DIR%
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
echo    1. thinko-struct-builder    - 结构大师
echo    2. thinko-template-writer   - 模板写手
echo    3. thinko-reading-analyzer  - 阅读侦探
echo    4. thinko-insight-extractor - 洞察猎人
echo    5. thinko-article-refiner   - 文章造型师
echo    6. thinko-report-generator  - 汇报嘴替
echo    7. thinko-idea-spark        - 鬼点子精
echo    8. thinko-outline-planner   - 提纲管家
echo    9. thinko-argument-builder  - 论点建筑师
echo   10. thinko-example-finder    - 例子猎人
echo   11. thinko-rewrite-artist    - 改写高手
echo   12. thinko-summary-maker     - 总结课代表
echo   13. thinko-style-polisher    - 文风造型师
echo   14. thinko-topic-explorer    - 选题探险家
echo.
echo 重启 Claude Code 即可使用！
echo.
pause
