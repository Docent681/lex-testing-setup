#!/usr/bin/bash

run_tests() {
    echo "===========================[ТЕСТИРОВАНИЕ ЛИСТИНГА $i]==========================="
    echo ""
    if [[ ! -d "$TESTS_DIR/task${i}" ]]; then
        echo "Директория с тестами для листинга $i не была найдена. Пропускаем данное тестирование."
        return 1;
    fi

    FILES_AMOUNT="$(find "$TESTS_DIR/task${i}" -type f | wc -l)"
    for CURRENT_SUBTEST in $(seq 1 $(("$FILES_AMOUNT" / 3)))
    do
        echo "---------------------------[ПРОВЕДЕНИЕ ТЕСТИРОВАНИЯ $CURRENT_SUBTEST]---------------------------"
        cat "$TESTS_DIR/task${i}/in${CURRENT_SUBTEST}.txt" | "$PROJECT_DIR/build/listing${i}" > "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Irl.txt"

        echo "Исходные данные:"
        cat "$TESTS_DIR/task${i}/in${CURRENT_SUBTEST}.txt"
        echo "Ожидаемый результат:"
        cat "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Exp.txt"
        echo "Полученный результат:"
        cat "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Irl.txt"

        if cmp -s "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Irl.txt" "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Exp.txt"; then
            echo ""
            echo -e "\033[0;32mПолученный результат совпал с ожидаемым, тест пройден\033[0m"
            echo ""
        else
            echo ""
            echo -e "\033[0;31mПолученный и ожидаемый результаты отличаются, тест не пройден\033[0m"
            echo "Отличия в результатах:"
            git diff --no-index "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Irl.txt" "$TESTS_DIR/task${i}/out${CURRENT_SUBTEST}Exp.txt"
            echo ""
        fi
    done
}

if [[ -z "$1" ]]; then
    echo "Использование:"
    echo "run.sh [<номер_листинга> | all]"
    echo "<номер_листинга> - определяет, для какого листинга будут запущены тесты"
    echo "Используйте all, если хотите запустить сразу все тесты"
    exit 1
fi

PROJECT_DIR="$HOME/FGTC/Labs/Lab1"
TESTS_DIR="$PROJECT_DIR/tests"

if [[ "$1" == "all" ]]; then
    WORKING_TESTS=({1..20})
else
    WORKING_TESTS=("$1")
fi

for i in "${WORKING_TESTS[@]}"
do
    run_tests
done
