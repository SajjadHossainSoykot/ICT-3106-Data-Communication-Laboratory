def bitStuffing (data:str, pattternLength:int):
    stuffedData = ""
    count = 0
    for bit in data:
        stuffedData+=bit
        if bit == '1':
            count+=1
            if count == pattternLength:
                stuffedData+='0'
                count = 0;
        else: count =0
    return stuffedData

def bitDeStuffing(stuffedData:str, patternLength:int):
    deStuffedData=""
    count = 0
    # for i in range(len(stuffedData)):
    #     deStuffedData+=stuffedData[i]
    #     if stuffedData[i]=='1':
    #         count+=1
    #     else: count = 0
    #     if count==patternLength and stuffedData[i+1]=='0':
    #         i+=1
    #         count=0
    i = 0
    while(i<len(stuffedData)):
        deStuffedData+=stuffedData[i]
        if stuffedData[i]=='1':
            count+=1
        else: count = 0
        if count==patternLength and stuffedData[i+1]=='0':
            i+=1
            count=0
        i+=1
    return deStuffedData

def isAllOnes(pattern):
    return pattern == '1'*len(pattern)

def main():
    data = input('Enter Bit Data: ')
    pattern = input("Enter Pattern (All 1's eg: 111, 1111 etc): ")
    patternLength=int
    if(isAllOnes(pattern)):
        patternLength = len(pattern)
    else: 
        print('Invalid Pattern. Exiting....')
        return
    patternLength = len(pattern)
    stuffedData = bitStuffing(data,patternLength)
    print(f'After Bit Stuffing: {stuffedData} \n-----------')
    deStuffedData=bitDeStuffing(stuffedData,patternLength)
    print(f'After Bit De Stuffing: {deStuffedData}')
main()