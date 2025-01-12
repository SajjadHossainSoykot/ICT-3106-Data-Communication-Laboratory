#include<iostream>
#include<string>
using namespace std;

bool isAllOnes(const string&pattern){
    return pattern == string(pattern.length(),'1');
}

string bitStuffing(const string& data, int patternLength)
{
    string stuffedData="";
    int count = 0;
    for(char bit: data)
    {   
        stuffedData+=bit;
        if(bit=='1'){
            count++;
            if(count==patternLength){
            stuffedData+='0';
            count=0;
            }
        }
        else count =0;
    }
    return stuffedData;
}

string bitDeStuffing(const string& stuffedData, int patternLength)
{
    string deStuffedData="";
    int count =0;
    for(size_t i =0 ; i<stuffedData.length(); i++)
    {
        deStuffedData+=stuffedData[i];
        if(stuffedData[i]=='1') count++;
        else count = 0;
        if(count==patternLength && stuffedData[i+1]=='0')
        {   
            i++;
            count = 0;
        }
    }
    return deStuffedData;
}

int main(){
    string data, pattern;
    cout<<"Enter Bit Data: ";
    cin>>data;
    cout<<"Enter Pattern (All 1's eg: 111, 1111 etc): ";
    cin>>pattern;
    
    int patternLength;
    if(isAllOnes(pattern)) {
        patternLength = pattern.length();
    }
    else{
        cout<<"Invalid Pattern. Exiting..."<<endl;
        return 0;
    }

    string stuffedData = bitStuffing(data, patternLength);
    cout<<"After Bit Stuffing: "<<stuffedData<<endl;

    string deStuffedData = bitDeStuffing(stuffedData,patternLength);
    cout<<"After Bit De-Stuffing: "<<deStuffedData<<endl;

    if(data==deStuffedData)cout<<"Frame is Intact and Recoverd Successfully"<<endl;
    else cout<<"ERROR!! Frame is Corrupted"<<endl;
}
