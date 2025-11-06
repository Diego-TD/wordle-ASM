#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Declaraciones de funciones
char *randomWord();
int randomNumber(int size);

int main(void) {
    srand(time(NULL));  // inicializar random una sola vez

    char *guessingWord = randomWord();
    printf("Palabra aleatoria: %s\n", guessingWord);

    int *mapped = mapWord(guessingWord);
    printf("Mapa de la palabra:\n");
    for (int i = 0; i < 26; i++) {
        printf("%c: %d\n", 'A' + i, mapped[i]);
    }

    return 0;
}


int randomNumber(int size) {
    return rand() % size;
}

char *randomWord() {
    static char *words[20] = {
        "QUIRK", "VEXED", "JAZZY", "NYMPH", "WHARF",
        "PIXEL", "ZESTY", "BLITZ", "CRYPT", "KNACK",
        "FJORD", "GUILT", "OZONE", "LYNCH", "TWIRL",
        "WOVEN", "MIRTH", "VAPID", "QUILT", "ZONAL"
    };

    int total = sizeof(words) / sizeof(words[0]);
    int randIdx = randomNumber(total);

    return words[randIdx];
}

int[] mapWord(char[] word) {
    int mappedWord[26];

    for (int i = 0; i < 26; i++) {
        mappedWord[i] = 0;
    }

    for (int i = 0; word[i] != '\0'; i++) {
        int index = word[i] - 'A';
        if (index >= 0 && index < 26) {
            mappedWord[index]++;
        }
    }

    return mappedWord;
}

