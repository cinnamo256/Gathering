@echo off
setlocal enabledelayedexpansion

:: 루트 디렉토리 설정
set BASE_DIR=src\main\java\com\example\gathering
set RESOURCES_DIR=src\main\resources

:: 도메인 리스트
set DOMAINS=dashboard calendar teamspace notification mypage

:: 공통 디렉토리 생성
mkdir %BASE_DIR%\common
mkdir %BASE_DIR%\config

:: 각 도메인에 계층 구조 생성
for %%D in (%DOMAINS%) do (
    mkdir %BASE_DIR%\%%D
    mkdir %BASE_DIR%\%%D\controller
    mkdir %BASE_DIR%\%%D\service
    mkdir %BASE_DIR%\%%D\dto
    mkdir %BASE_DIR%\%%D\domain
)

:: resources 디렉토리 기본 구조
mkdir %RESOURCES_DIR%
mkdir %RESOURCES_DIR%\static
mkdir %RESOURCES_DIR%\templates

echo 프로젝트 디렉토리 구조 생성 완료!
pause
