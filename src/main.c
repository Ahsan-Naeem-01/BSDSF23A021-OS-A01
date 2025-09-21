#include <stdio.h>
#include <stdlib.h>   // for malloc, free
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");

    char str1[100] = "Hello";
    char str2[100] = "World";

    // mystrlen
    printf("Length of str1 'Hello' = %d\n", mystrlen(str1));

    // mystrcat
    mystrcat(str1, str2);
    printf("Concatenated: %s\n", str1);

    // mystrcpy
    char str3[100];
    mystrcpy(str3, "CopyTest");
    printf("Copied string: %s\n", str3);

    // mystrncpy
    char str4[100];
    mystrncpy(str4, str1, 4);
    str4[4] = '\0'; // ensure termination
    printf("First 4 chars copied: %s\n", str4);

    printf("\n--- Testing File Functions ---\n");

    FILE* fp = fopen("test.txt", "r");
    if (fp) {
        int lines, words, chars;
        wordCount(fp, &lines, &words, &chars);
        printf("Lines=%d Words=%d Chars=%d\n", lines, words, chars);

        char** matches;
        int found = mygrep(fp, "test", &matches);
        printf("Found %d matches:\n", found);
        for (int i = 0; i < found; i++) {
            printf("%s", matches[i]);
            free(matches[i]);
        }
        free(matches);

        fclose(fp);
    } else {
        printf("Could not open test.txt (create it with sample text!)\n");
    }

    return 0;
}

