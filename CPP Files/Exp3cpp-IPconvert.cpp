#include <iostream>
#include <sstream>
#include <bitset>

using namespace std;

// Convert Decimal IP to Binary IP
string decimalToBinary(const string& decimalIP) {
    stringstream ss(decimalIP);
    string octet, binaryIP;

    while (getline(ss, octet, '.')) {
        int num = stoi(octet);               // Convert string to integer
        binaryIP += bitset<8>(num).to_string() + "."; // Convert to 8-bit binary and append
    }
    binaryIP.pop_back(); // Remove trailing dot
    return binaryIP;
}

// Convert Binary IP to Decimal IP
string binaryToDecimal(const string& binaryIP) {
    stringstream ss(binaryIP);
    string octet, decimalIP;

    while (getline(ss, octet, '.')) {                    // Read each 8-bit binary octet
        int num = stoi(octet, nullptr, 2);  // Convert binary string to integer
        decimalIP += to_string(num) + ".";  // Append to result
    }

    decimalIP.pop_back(); // Remove trailing dot
    return decimalIP;
}

int main() {
    string decimalIP, binaryIP;

    // Decimal to Binary Conversion
    cout << "Enter Decimal IPv4 Address (e.g., 192.168.1.1): ";
    cin >> decimalIP;
    string binaryRepresentation = decimalToBinary(decimalIP);
    cout << "Binary Representation: " << binaryRepresentation << endl;

    // Binary to Decimal Conversion
    cout << "Enter Binary IPv4 Address: ";
    cin.ignore(); // Clear input buffer
    getline(cin, binaryIP);
    string decimalRepresentation = binaryToDecimal(binaryIP);
    cout << "Decimal Representation: " << decimalRepresentation << endl;

    return 0;
}
