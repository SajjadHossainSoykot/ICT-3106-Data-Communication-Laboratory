#include <iostream>
#include <sstream>
#include <bitset>
using namespace std;

string decToBin(const string &DecimalIP)
{
    string octet, BinaryIP;
    stringstream ss(DecimalIP);
    while (getline(ss, octet, '.'))
    {
        int num = stoi(octet);
        BinaryIP += bitset<8>(num).to_string() + '.';
    }
    BinaryIP.pop_back();
    return BinaryIP;
}

string binToDec(const string &BinaryIP)
{
    string octet, DecimalIP;
    stringstream ss(BinaryIP);
    while (getline(ss, octet, '.'))
    {
        int num = stoi(octet, nullptr, 2);
        DecimalIP += to_string(num) + '.';
    }
    DecimalIP.pop_back();
    return DecimalIP;
}

int main()
{
    string decimalIP, binaryIP;

    // Decimal to Binary Conversion
    cout << "Enter Decimal IPv4 Address (e.g., 192.168.1.1): ";
    cin >> decimalIP;
    cout << "Binary Representation: " << decToBin(decimalIP) << endl;

    // Binary to Decimal Conversion
    cout << "Enter Binary IPv4 Address: ";
    cin >> binaryIP;
    cout << "Decimal Representation: " << binToDec(binaryIP) << endl;
    return 0;
}