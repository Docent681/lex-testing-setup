#!/usr/bin/bash

set -euo pipefail

if [[ ! -f "./dir_path" ]]; then
    echo "Не нашли файл dir_path с указанием корня проекта в текущей директории, выходим из программы"
    exit 1
fi

TESTS_DIR="$(< dir_path)/tests"


for TASK_DIR in "$TESTS_DIR/"*
do
    if [[ "$TASK_DIR" == "$TESTS_DIR/run.sh" ]]; then
        continue
    fi

    FILES_AMOUNT="$(find "$TASK_DIR" -type f | wc -l)"


    for i in $(seq 1 $(("$FILES_AMOUNT" / 3)))
    do
        if [[ ! -e "$TASK_DIR/out${i}Irl.txt" || ! -e "$TASK_DIR/out${i}Exp.txt" ]]; then
            continue
        fi

        if [[ -s "$TASK_DIR/out${i}Exp.txt" ]]; then
            continue
        fi

        cp "$TASK_DIR/out${i}Irl.txt" "$TASK_DIR/out${i}Exp.txt"
    done
done
exit 0
