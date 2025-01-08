#include <stdio.h>
#include <string.h>

#define MAX 100

void bitStuffing(const char *data, char *stuffedData) {
    int count = 0, j = 0;

    for (int i = 0; data[i] != '\0'; i++) {
        stuffedData[j++] = data[i];

        if (data[i] == '1') {
            count++;
            if (count == 5) {
                stuffedData[j++] = '0'; // Add a 0 after five consecutive 1s
                count = 0;
            }
        } else {
            count = 0;
        }
    }
    stuffedData[j] = '\0'; // Null-terminate the string
}

void bitDeStuffing(const char *stuffedData, char *deStuffedData) {
    int count = 0, j = 0;

    for (int i = 0; stuffedData[i] != '\0'; i++) {
        if (stuffedData[i] == '1') {
            count++;
        } else {
            count = 0;
        }

        deStuffedData[j++] = stuffedData[i];

        // Skip the stuffed '0' after five consecutive 1s
        if (count == 5 && stuffedData[i + 1] == '0') {
            i++;
            count = 0;
        }
    }
    deStuffedData[j] = '\0'; // Null-terminate the string
}

int main() {
    char data[MAX], stuffedData[MAX], deStuffedData[MAX];

    printf("Enter data bits (e.g., 110011111100): ");
    scanf("%s", data);

    bitStuffing(data, stuffedData);
    printf("After Bit Stuffing: %s\n", stuffedData);

    bitDeStuffing(stuffedData, deStuffedData);
    printf("After Bit De-stuffing: %s\n", deStuffedData);

    return 0;
}
