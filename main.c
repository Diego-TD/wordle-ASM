#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern char* randomWord();
extern int* mapWord(char* word);
extern int guessCheck(char* guess, char* word);

// Declaraciones de funciones

/*
char *randomWord();
int randomNumber(int size);
int *mapWord(char *word);
void guessCheck(char *guess, char *word);
*/

int main(void) {
    /*
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

    char word[5] = {'R', 'A', 'M', 'I', 'C'};
    char guess[5] = {'R', 'A', 'I', 'P', 'L'};
    for (int i = 0; i < 5; i++){
        printf(" %c ", word[i]);
    }

    printf("\n");
    guessCheck(guess, word);
    */

    srand(time(NULL));
    char *word = randomWord();
    
    int tries = 6;
    char guess[6];
    int correct = 0;

    printf("- - - Welcome to Wordle - - -\n");
    printf("Insert a 5 letter word:\n");
    while (tries-- && !correct){
        //printf("Number of tries: %d\n", tries + 1);
        scanf("%5s", guess);
        for (int i = 0; i < 5; i++){
            if (guess[i] >= 'a' && guess[i] <= 'z'){
                guess[i] -= 32;
            }
            else if (guess[i] < 'A' || guess[i] > 'Z'){
                printf("Your input contains an invalid character (Only letters)");
                tries++;
                break;
            }
        }
        correct = guessCheck(guess, word);
        printf("\n");
    }
    printf("The word was: %s\n", word);
    return 0;
}

/*
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
    for (int i = 0; i < 5; i++)
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
        if (result[i] == 2){
            printf("\033[42m %c \033[0m", guess[i]);
        }
        else if (result[i] == 1){
            printf("\033[43m %c \033[0m", guess[i]);
        }
        else {
            printf("\033[47m %c \033[0m", guess[i]);
        }
    }
}
*/