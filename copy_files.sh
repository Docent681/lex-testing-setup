#!/usr/bin/bash


TESTS_DIR="$HOME/FGTC/Labs/Lab1/tests"


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
