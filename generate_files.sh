#!/usr/bin/bash

if [[ -z "$1" ]]; then
    printf "Использование:\n"
    printf "generate_files.sh <количество_групп_файлов>]\n"
    printf "<количество_групп_файлов> - определяет, сколько троек файлов для тестов будет сгненерировано\n"
    printf "Используйте all, если хотите запустить сразу все тесты\n"
    exit 1
fi

TESTS_DIR="$HOME/FGTC/Labs/Lab1/tests"

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
