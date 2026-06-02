#include <iostream>
#include <cassert>
#include "ota_validator.h"

void test_null_pointer() {
    std::cout << "[TEST] Running NULL pointer evaluation... ";
    assert(validate_firmware(NULL) == -1);
    std::cout << "PASS\n";
}

void test_version_zero() {
    std::cout << "[TEST] Running Version 0 boundary evaluation... ";
    firmware_info_t fw = {0, 0x12345678, 2048};
    assert(validate_firmware(&fw) == -1);
    std::cout << "PASS\n";
}

// NOTE: Comment out this entire test block function during the intentional failure exercise
void test_checksum_zero() {
    std::cout << "[TEST] Running Checksum 0 boundary evaluation... ";
    firmware_info_t fw = {1, 0, 2048};
    assert(validate_firmware(&fw) == -1);
    std::cout << "PASS\n";
}

void test_size_too_small() {
    std::cout << "[TEST] Running Size under 1024 bytes threshold... ";
    firmware_info_t fw = {1, 0x12345678, 1023};
    assert(validate_firmware(&fw) == -1);
    std::cout << "PASS\n";
}

void test_valid_image() {
    std::cout << "[TEST] Running Valid firmware configurations... ";
    firmware_info_t fw = {1, 0x12345678, 1024};
    assert(validate_firmware(&fw) == 0);
    std::cout << "PASS\n";
}

int run_test_suite() {
    std::cout << "========================================\n";
    std::cout << "Initializing OTA Validator Test Harness\n";
    std::cout << "========================================\n";
    
    test_null_pointer();
    test_version_zero();
    test_checksum_zero(); // Clear this line during intentional failure task
    test_size_too_small();
    test_valid_image();
    
    std::cout << "----------------------------------------\n";
    std::cout << "All registered assertions validated successfully.\n";
    return 0;
}
