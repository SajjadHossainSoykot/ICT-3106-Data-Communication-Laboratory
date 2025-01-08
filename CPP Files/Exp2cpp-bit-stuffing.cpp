#include <iostream>
#include <string>

using namespace std;

string bitStuffing(const string& data) {
    string stuffedData = "";
    int count = 0;

    for (char bit : data) {
        stuffedData += bit;

        if (bit == '1') {
            count++;
            if (count == 5) {
                stuffedData += '0'; // Add a 0 after five consecutive 1s
                count = 0;
            }
        } else {
            count = 0;
        }
    }

    return stuffedData;
}

string bitDeStuffing(const string& stuffedData) {
    string deStuffedData = "";
    int count = 0;

    for (size_t i = 0; i < stuffedData.length(); i++) {
        deStuffedData += stuffedData[i];

        if (stuffedData[i] == '1') {
            count++;
        } else {
            count = 0;
        }

        // Skip the stuffed '0' after five consecutive 1s
        if (count == 5 && stuffedData[i + 1] == '0') {
            i++; // Skip the next '0'
            count = 0;
        }
    }

    return deStuffedData;
}

int main() {
    string data;

    cout << "Enter data bits (e.g., 110011111100): ";
    cin >> data;

    string stuffedData = bitStuffing(data);
    cout << "After Bit Stuffing: " << stuffedData << endl;

    string deStuffedData = bitDeStuffing(stuffedData);
    cout << "After Bit De-stuffing: " << deStuffedData << endl;

    return 0;
}
