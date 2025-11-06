#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Declaraciones de funciones
char *randomWord();
int randomNumber(int size);
int *mapWord(char *word);

int main(void) {
    srand(time(NULL));  // inicializar random una sola vez

    //Random Word
    char *guessingWord = randomWord();
    printf("Palabra aleatoria: %s\n", guessingWord);

    //Map that word
    int *mappedSystemWord = mapWord(guessingWord);
    for (int i = 0; i < 26; i++) {
        printf("%c: %d\n", i + 'A', mappedSystemWord[i]);
    }
    free(mappedSystemWord);

    // Make logic for user attempts

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

int *mapWord(char *word) {
    int *mappedWord = calloc(26, sizeof(int));

    for (int i = 0; i < 5; i++) {
        int idx = word[i] - 'A';
        mappedWord[idx]++;
    }

    return mappedWord;
}

