@echo off
REM ============================================================
REM 毕业论文一键编译脚本 (XeLaTeX + BibTeX 串行版)
REM 作者: 胡恒宇  学号: 23721929
REM 用法: 双击运行, 或在命令行执行 build.bat
REM 说明: 不依赖 Perl/latexmk, 直接串行调用, 最通用最稳妥
REM ============================================================

setlocal
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ============================================================
echo   [1/4] XeLaTeX 第一次编译 (生成 aux/toc)...
echo ============================================================
xelatex -interaction=nonstopmode -file-line-error -synctex=1 main.tex
if errorlevel 1 goto error

echo.
echo ============================================================
echo   [2/4] BibTeX 处理参考文献...
echo ============================================================
bibtex main
REM bibtex 对 warning 常报非零退出码, 故不作失败判断

echo.
echo ============================================================
echo   [3/4] XeLaTeX 第二次编译 (嵌入参考文献)...
echo ============================================================
xelatex -interaction=nonstopmode -file-line-error -synctex=1 main.tex
if errorlevel 1 goto error

echo.
echo ============================================================
echo   [4/4] XeLaTeX 第三次编译 (处理交叉引用)...
echo ============================================================
xelatex -interaction=nonstopmode -file-line-error -synctex=1 main.tex
if errorlevel 1 goto error

echo.
echo ============================================================
echo   [OK] 编译成功!  输出文件: main.pdf
echo ============================================================
echo.

REM 可选: 自动打开 PDF (取消下行注释即可)
REM start "" main.pdf

pause
exit /b 0

:error
echo.
echo ============================================================
echo   [X] 编译失败! 请查看 main.log 排查错误.
echo       常见原因: LaTeX 语法错误 / 参考文献 key 错误 / 图片缺失.
echo       提示: 可在 main.log 中搜索 "Error" 或 "! "
echo ============================================================
echo.
pause
exit /b 1

endlocal
