#!/usr/bin/bash

set -euo pipefail

if [[ ! -f "./dir_path" ]]; then
    echo "Не нашли файл dir_path с указанием корня проекта в текущей директории, выходим из программы"
    exit 1
fi


if [[ -z "$1" ]]; then
    printf "Использование:\n"
    printf "generate_files.sh <количество_групп_файлов>\n"
    printf "<количество_групп_файлов> - определяет, сколько троек файлов для тестов будет сгненерировано\n"
    exit 1
fi

TESTS_DIR="$(< dir_path)/tests"

for TASK_DIR in "$TESTS_DIR/"*
do
    if [[ "$TASK_DIR" == "$TESTS_DIR/run.sh" ]]; then
        continue
    fi

    for i in $(seq 1 "$1")
    do
        touch "$TASK_DIR/in${i}.txt"
        touch "$TASK_DIR/out${i}Exp.txt"
        touch "$TASK_DIR/out${i}Irl.txt"
    done
done
