#include <stdio.h>
#include <string.h>

#define FLAG1 "DLESTX"
#define FLAG2 "DLEETX"

void characterStuffing(const char *data, char *stuffedData) {
    // Add Starting Flag Sequence
    strcpy(stuffedData, FLAG1);

    // Character Stuffing
    for (int i = 0; i < strlen(data); i++) {
        if (strncmp(&data[i], "DLE", 3) == 0) {
            strcat(stuffedData, "DLE"); // Add extra "DLE" if found
        }
        strncat(stuffedData, &data[i], 1); // Add the current character
    }

    // Add Ending Flag Sequence
    strcat(stuffedData, FLAG2);
}

void characterDeStuffing(const char *stuffedData, char *deStuffedData) {
    int i = strlen(FLAG1); // Start after the starting flag
    int stuffedLength = strlen(stuffedData);
    int flag2Length = strlen(FLAG2);

    while (i < stuffedLength - flag2Length) { // Avoid the ending flag
        if (strncmp(&stuffedData[i], "DLE", 3) == 0 && strncmp(&stuffedData[i + 3], "DLE", 3) == 0) {
            i += 3; // Skip the extra "DLE"
        }
        strncat(deStuffedData, &stuffedData[i], 1); // Add the current character
        i++;
    }
}

int main() {
    char data[100], stuffedData[200] = "", deStuffedData[100] = "";

    printf("Enter Data in Uppercase: ");
    scanf("%s", data);

    // Perform Character Stuffing
    characterStuffing(data, stuffedData);
    printf("After Stuffing: %s\n", stuffedData);

    // Perform Character De-stuffing
    characterDeStuffing(stuffedData, deStuffedData);
    printf("After De-stuffing: %s\n", deStuffedData);

    return 0;
}