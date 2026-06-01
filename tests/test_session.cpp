#include <iostream>
#include <cassert>
#include "session.h"

void test_null_session_pointer() {
    std::cout << "[TEST] Running: Null session pointer check... ";
    int result = create_session(NULL, 101, 500);
    assert(result == -1);
    std::cout << "PASS\n";
}

void test_zero_amount() {
    std::cout << "[TEST] Running: Zero amount failure check... ";
    payment_session_t session;
    int result = create_session(&session, 102, 0);
    assert(result == -1);
    std::cout << "PASS\n";
}

void test_valid_session() {
    std::cout << "[TEST] Running: Valid session tracking check... ";
    payment_session_t session;
    int result = create_session(&session, 103, 2500);
    assert(result == 0);
    assert(session.session_id == 103);
    assert(session.amount == 2500);
    std::cout << "PASS\n";
}

int main() {
    std::cout << "========================================\n";
    std::cout << "Executing Payment Session Test Harness\n";
    std::cout << "========================================\n";
    
    test_null_session_pointer();
    test_zero_amount();
    test_valid_session();
    
    std::cout << "----------------------------------------\n";
    std::cout << "All unit tests completed successfully!\n";
    return 0;
}
