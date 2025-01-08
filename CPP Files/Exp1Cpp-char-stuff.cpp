#include <iostream>
#include <string>

using namespace std;

const string FLAG1 = "DLESTX";
const string FLAG2 = "DLEETX";

string characterStuffing(const string& data) {
    string stuffedData = FLAG1; // Add Starting Flag Sequence

    // Character Stuffing
    for (size_t i = 0; i < data.length(); ++i) {
        if (data.substr(i, 3) == "DLE") {
            stuffedData += "DLE";
        }
        stuffedData += data[i];
    }

    stuffedData += FLAG2; // Add Ending Flag Sequence
    return stuffedData;
}

string characterDeStuffing(const string& stuffedData) {
    string deStuffedData = "";

    size_t i = FLAG1.length(); // Start after the starting flag
    while (i < stuffedData.length() - FLAG2.length()) { // Avoid the ending flag
        if (stuffedData.substr(i, 3) == "DLE" && stuffedData.substr(i + 3, 3) == "DLE") {
            i += 3; // Skip one "DLE" in case of stuffing
        }
        deStuffedData += stuffedData[i];
        ++i;
    }

    return deStuffedData;
}

int main() {
    string data;

    cout << "Enter Data in Uppercase: ";
    cin >> data;

    // Perform Character Stuffing
    string stuffedData = characterStuffing(data);
    cout << "After Stuffing: " << stuffedData << endl;

    // Perform Character De-stuffing
    string deStuffedData = characterDeStuffing(stuffedData);
    cout << "After De-stuffing: " << deStuffedData << endl;

    return 0;
}