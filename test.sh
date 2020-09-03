# call this script in the cmd line to run tests (might be different on Windows)
# `sh test.sh`

# Test Cases
for i in 01 02 03 04 05 06 07 08 09 10 11
do
    psql -f tests/testCases/tc${i}.sql > tests/sql_log/log${i}.txt
    echo Test Case ${i}:

    # Union
    psql -f union.sql > tests/output/output$i-union.txt
    # bash -c "diff -iEBwu <(sort tests/output/output$i-union.txt) <(sort tests/outputExpected/expected$i-union.txt) > tests/output$i-union.diff"
    bash -c "diff -iEBwu <(cat tests/output/output$i-union.txt) <(cat tests/outputExpected/expected$i-union.txt) > tests/output$i-union.diff"
    if [ $? -ne 0 ]; then
        # display "test case FAILED" to the screen. The word "FAILED" is highlighted in red
        echo "  - union:       \033[1;91mfailed.\033[0m"
    else
        # display "test case PASSED" to the screen. The word "PASSED" is highlighted in green
        echo "  - union:       \033[1;92mpassed.\033[0m"
        # remove the .diff file
        rm -f tests/output${i}-union.diff
    fi

    # Intersect
    psql -f intersect.sql > tests/output/output$i-intersect.txt
    bash -c "diff -iEBwu <(cat tests/output/output$i-intersect.txt) <(cat tests/outputExpected/expected$i-intersect.txt) > tests/output$i-intersect.diff"
    if [ $? -ne 0 ]; then
        # display "test case FAILED" to the screen. The word "FAILED" is highlighted in red
        echo "  - intersect:   \033[1;91mfailed.\033[0m"
    else
        # display "test case PASSED" to the screen. The word "PASSED" is highlighted in green
        echo "  - intersect:   \033[1;92mpassed.\033[0m"
        # remove the .diff file
        rm -f tests/output${i}-intersect.diff
    fi

    # Containment
    psql -f containment.sql > tests/output/output$i-containment.txt
    bash -c "diff -iEBwu <(cat tests/output/output$i-containment.txt) <(cat tests/outputExpected/expected$i-containment.txt) > tests/output$i-containment.diff"
    if [ $? -ne 0 ]; then
        # display "test case FAILED" to the screen. The word "FAILED" is highlighted in red
        echo "  - containment: \033[1;91mfailed.\033[0m"
    else
        # display "test case PASSED" to the screen. The word "PASSED" is highlighted in green
        echo "  - containment: \033[1;92mpassed.\033[0m"
        # remove the .diff file
        rm -f tests/output${i}-containment.diff
    fi

done

# check for any failed test cases
for i in 01 02 03 04 05 06 07 08 09 10 11
do
    if [ -f tests/output${i}-union.diff ]; then
        echo
        echo ----------------------------------------------------------
        # print 'see tests/output$i.diff' in red
        echo "\033[1;91msee tests/output$i-union.diff\033[0m"
        # print 'Expected:' in green
        echo "\033[1;92mExpected:\033[0m"
        cat tests/outputExpected/expected${i}-union.txt
        # print 'Got:' in red
        echo "\033[1;91mGot:\033[0m"
        cat tests/output/output${i}-union.txt
    fi

    if [ -f tests/output${i}-intersect.diff ]; then
        echo
        echo ----------------------------------------------------------
        # print 'see tests/output$i.diff' in red
        echo "\033[1;91msee tests/output$i-intersect.diff\033[0m"
        # print 'Expected:' in green
        echo "\033[1;92mExpected:\033[0m"
        cat tests/outputExpected/expected${i}-intersect.txt
        # print 'Got:' in red
        echo "\033[1;91mGot:\033[0m"
        cat tests/output/output${i}-intersect.txt
    fi

    if [ -f tests/output${i}-containment.diff ]; then
        echo
        echo ----------------------------------------------------------
        # print 'see tests/output$i.diff' in red
        echo "\033[1;91msee tests/output$i-containment.diff\033[0m"
        # print 'Expected:' in green
        echo "\033[1;92mExpected:\033[0m"
        cat tests/outputExpected/expected${i}-containment.txt
        # print 'Got:' in red
        echo "\033[1;91mGot:\033[0m"
        cat tests/output/output${i}-containment.txt
    fi
done

