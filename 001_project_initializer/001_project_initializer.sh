#!/bin/bash

# 캡스톤치맥회동 AI 스터디 shell script

# 스터디 개요
# 1. 최상위 및 하위 디렉토리 구조 생성
# 2. 특정 디렉토리 내 템플릿 파일 생성
# 3. 특정 파일 내 텍스트 추가

# 스터디로 얻어갈 수 있는 능력
# * mkdir, echo, cat, date 등 Linux 핵심 명령어를 숙달할 수 있습니다.
# * function을 활용해 모듈화된 스크립트를 만들 수 있습니다.
# * 표준 디렉토리 구조와 템플릿 파일을 단 한 번의 명령으로 준비하는 CI/CD의 기초 단계를 이해할 수 있습니다.

# [TODO]에 코드를 추가하면 됩니다!



# --- 전역 변수 설정 ---

PROJECT_NAME="root"
TODAY=$(date +%Y-%m-%d)
DESCRIPTION="Hello World"



# --- 함수 정의 영역 ---

# [TODO 1]. 프로젝트 이름으로 최상위 폴더 및 하위 디렉토리 구조를 생성합니다.
function create_directories() {
    # 이미 동일 이름의 폴더가 존재하면, "이미 존재합니다"라는 메시지만 출력하고 종료합니다.
    # 힌트: [분기]if문 -d 옵션, [출력]echo, [종료]exit, [폴더 생성]mkdir -p 옵션

    # 생성해야 하는 디렉토리 구조는 아래와 같습니다.
    # root/
    # ----data/
    #   |----raw/
    #   |----processed/
    # ----notebooks/
    # ----src/
    # ----README.md
    # ----.gitngnore

    if [ -d "$PROJECT_NAME" ]; then
        echo "이미 존재합니다"
	exit
    fi

    mkdir -p "$PROJECT_NAME"/data/raw
    mkdir -p "$PROJECT_NAME"/data/processed
    mkdir -p "$PROJECT_NAME"/notebooks
    mkdir -p "$PROJECT_NAME"/src
}


# [TODO 2]. 디렉토리 안에 템플릿 파일(.gitignore, README.md)을 생성합니다.
function create_templates() {
    # .gitignore, README.md 파일이 존재하지 않는다면, 새로 생성합니다.
    # 힌트: [분기]if문의 -f 옵션, [파일 생성] cat > << EOF 구조
    
    if [ ! -f "$PROJECT_NAME"/.gitignore ]; then
        cat > "$PROJECT_NAME"/.gitignore << EOF
EOF
    fi

    if [ ! -f "$PROJECT_NAME"/README.md ]; then
        cat > "$PROJECT_NAME"/README.md << EOF
EOF
    fi
}


# [TODO 3]. README.md에 프로젝트 이름, 오늘 날짜, 간단 설명 등의 내용을 작성합니다.
function write_readme_content() {
    # 힌트: [덮어쓰기] 리다이렉션(>), [파일의 맨 끝에 내용 추가하기] 리다이렉션(>>)

    echo "$PROJECT_NAME" > "$PROJECT_NAME"/README.md
    echo "$DATE" >> "$PROJECT_NAME"/README.md
    echo "$DESCRIPTION" >> "$PROJECT_NAME"/README.md

}


# [TODO 4]. 최종적으로 생성된 프로젝트 디렉토리의 전체 구조를 출력합니다.
function show_structure() {
    # 힌트: [파일트리 구조 출력]tree
    tree "$PROJECT_NAME" -a
}



# --- 메인 실행 흐름 ---

# 1. 디렉토리 구조 생성
create_directories

# 2. 템플릿 생성
create_templates

# 3. .gitignore 파일 생성
write_readme_content

# 4. 최종 결과 출력
show_structure
