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
