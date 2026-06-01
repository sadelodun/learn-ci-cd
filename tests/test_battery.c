#include <stdio.h>
#include "battery.h"
#include <assert.h>

void run_test(int input_mv, int expected_percent) {
    int actual = battery_mv_to_percent(input_mv);
    printf("[TEST] Input: %4dmV | Expected: %3d%% | Actual: %3d%% -> ", input_mv, expected_percent, actual);

    if (actual == expected_percent) {
        printf("PASS\n");
    } else {
        printf("FAIL\n");
        assert(actual == expected_percent); // Will abort execution if test fails
    }
}

int main (void)
{
    printf("Running Firmware Test Suite...\n");
    printf("---------------------------------\n");

    // Test cases outlined in requirements
    run_test(0, 0);     // Minimum boundary
    run_test(2100, 50);     //Midpoint
    run_test(4200, 100);    // Maximum boundary
    run_test(5000, 100);    // Upper out-of-bounds clamping
    run_test(-100, 0);      // Lower out-of-bounds clamping

    printf("---------------------------------------");
    printf("All boundary tests passed successfully!\n");
    return 0;
    
}