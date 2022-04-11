#include "Hashtable/Hashtable.h"


const size_t HT_SIZE = 5000;

const size_t ONE = 1;

static void print_key(const hkey_t* key){
    printf("%-30s", key->s);
}

static void print_data(const data_t* data){
    printf("%4zu", *data);
}

static void loadWords(Hashtable* ht, const char* filename);
static void printStatisctics(const Hashtable* ht, const char* filename);

static void loadWords(Hashtable* ht, const char* filename){
    FILE* file = fopen(filename, "r");
    word* wd = (word*)aligned_alloc(32, sizeof(word));
    // _mm256_store_si256((__m256i*)(wd->s), _mm256_setzero_si256());
    memset(wd, 0, 32);
    while(fscanf(file, "%30s", wd->s) != EOF){
        size_t* cnt = NULL;
        if((cnt = findHashtable(ht, wd)) != NULL){
            (*cnt)++;
        }
        else insertHashtable(ht, wd, &ONE);
        // _mm256_store_si256((__m256i*)(wd->s), _mm256_setzero_si256());
        memset(wd, 0, 32);
    }
    free(wd);
    fclose(file);
}

static void printStatisctics(const Hashtable* ht, const char* filename){
    FILE* file = fopen(filename, "r");
    word* wd = (word*)aligned_alloc(32, sizeof(word));
    // _mm256_store_si256((__m256i*)(wd->s), _mm256_setzero_si256());
    memset(wd, 0, 32);
    int gcnt = 0;
    while(fscanf(file, "%30s", wd->s) != EOF){
        size_t* cnt = NULL;
        for(size_t i = 0; i < 1000; ++i){
            if((cnt = findHashtable(ht, wd)) != NULL){
                gcnt++;
            }
        }
        // _mm256_store_si256((__m256i*)(wd->s), _mm256_setzero_si256());
        memset(wd, 0, 32);
    }
    printf("%d\n", gcnt);
    fclose(file);
    free(wd);
}



int main(){
    Hashtable* ht = createHashtable(HT_SIZE);
    
    loadWords(ht, "text.txt");
    // printStatisctics(ht, "text.txt");
    // dumpHashtable(ht, print_key, print_data);

    for(size_t i = 0; i < ht->capacity; ++i){
        printf("%zu, \n", ht->data[i] == 0 ? 0 : ht->htlist.data[ht->data[i]].cnt - 1);
    }
    deleteHashtable(ht);
    return 0;
}