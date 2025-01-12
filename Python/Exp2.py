def bitStuffing(data):
    stuffedData = ""
    count = 0
    for bit in data:
        stuffedData+=bit
        if bit == '1':
            count+=1
            if count==5:
                stuffedData+='0'
                count =0
        else: count = 0
    return stuffedData

def bitDeStuffing(stuffedData):
    deStuffedData =""
    count = 0
    i = 0
    while i <len(stuffedData):
        deStuffedData+=stuffedData[i]
        if stuffedData[i]=='1':
            count+=1
        else: count =0
        if count == 5 and i+1<len(stuffedData) and stuffedData[i+1]=='0':
            i+=1
            count =0
        i+=1
    return deStuffedData

def main():
    data = input('Enter Bit Data: ')

    stuffedData = bitStuffing(data)
    print(f'After Bit Stuffing: {stuffedData}')

    deStuffedData = bitDeStuffing(stuffedData)
    print(f'After Bit De Stuffing: {deStuffedData}')


if __name__ == "__main__":
    main()
