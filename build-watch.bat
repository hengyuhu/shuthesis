@echo off
REM ============================================================
REM 毕业论文增量编译脚本 (单次 XeLaTeX)
REM 说明: 只跑一次 xelatex, 速度最快, 适合撰写正文时预览
REM 注意: 正式交付前请用 build.bat 完整编译以更新交叉引用
REM ============================================================

setlocal
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ============================================================
echo   快速预览编译 (单次 xelatex) ...
echo ============================================================

xelatex -interaction=nonstopmode -file-line-error -synctex=1 main.tex

if errorlevel 1 (
    echo.
    echo   [X] 编译失败! 详见 main.log
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   [OK] 快速编译完成!  输出: main.pdf
echo   * 如修改了参考文献/章节号, 请运行 build.bat 完整编译
echo ============================================================
echo.
pause
endlocal
