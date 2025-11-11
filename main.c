#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Declaraciones de funciones
char *randomWord();
int randomNumber(int size);
int *mapWord(char *word);
void guessCheck(char *guess, char *word);

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

    char word[5] = {'W', 'A', 'Z', 'A', 'A'};
    char guess[5] = {'A', 'A', 'A', 'A', 'A'};
    for (int i = 0; i < 5; i++){
        printf("%c ", word[i]);
    }

    printf("\n");

    for (int i = 0; i < 5; i++){
        printf("%c ", guess[i]);
    }

    printf("\n");
    guessCheck(guess, word);

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

void guessCheck(char *guess, char *word){
    int *mapped = mapWord(word), result[5];

    //green
    for (int i = 0; i < 5; i++) {
        if (guess[i] == word[i]) {
            result[i] = 2;   
            mapped[guess[i] - 'A']--;
        }
    }

    //yellow and black
    for (int i = 0; i < 5; i++){
        if (result[i] != 2){
            int index = guess[i] - 'A';
            if (mapped[index] > 0){
                result[i] = 1;
                mapped[index]--;
            }
            else {
                result[i] = 0;
            }
        }
    }

    //showing 
    for (int i = 0; i < 5; i++){
        printf("%d ", result[i]);
    }
}