@echo off
REM ============================================================
REM 清理所有编译辅助文件 (保留 main.tex 源码与 main.pdf)
REM 当遇到 "编译死循环"、"辅助文件被锁" 等异常时使用
REM ============================================================

setlocal
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ============================================================
echo   清理 LaTeX 编译中间文件 ...
echo ============================================================

REM 使用 latexmk 自带的清理功能 (更安全)
latexmk -c main.tex

REM 额外清理 shuthesis 模板可能产生的文件
del /s /q *.aux   2>nul
del /s /q *.log   2>nul
del /s /q *.bbl   2>nul
del /s /q *.blg   2>nul
del /s /q *.toc   2>nul
del /s /q *.lof   2>nul
del /s /q *.lot   2>nul
del /s /q *.loa   2>nul
del /s /q *.out   2>nul
del /s /q *.idx   2>nul
del /s /q *.ilg   2>nul
del /s /q *.ind   2>nul
del /s /q *.thm   2>nul
del /s /q *.synctex.gz  2>nul
del /s /q *.fls   2>nul
del /s /q *.fdb_latexmk 2>nul
del /s /q *.xdv   2>nul

echo.
echo ============================================================
echo   [OK] 清理完成!
echo ============================================================
echo.
pause
endlocal
