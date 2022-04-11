#include "Hashtable.h"
#include <assert.h>
#include <string.h>
#include <nmmintrin.h>
#include <immintrin.h>
#pragma GCC target("sse4.2")
#pragma GCC target("avx2")

#undef EQ
#define EQ(a, b) !mycmp(a, b)
// #define EQ(x, y) !strncmp((const char*)(x), (const char*)(y), sizeof(hkey_t))
// #define EQ(x, y) !memcmp((const char*)(x), (const char*)(y), sizeof(hkey_t))

static inline int mycmp(const hkey_t* a, const hkey_t* b);

static inline int mycmp(const hkey_t* a, const hkey_t* b){
    __m256i s1 = _mm256_load_si256((const __m256i*)a);
    __m256i s2 = _mm256_load_si256((const __m256i*)b);
    return  ~_mm256_movemask_epi8(_mm256_cmpeq_epi8(s1, s2));
    return 0;
}

#ifdef HMAP
HashtableListNodeIt insertHashtableListNode(HashtableList* htlist, HashtableListNodeIt parent, const hkey_t* key, const data_t* data){
#else
HashtableListNodeIt insertHashtableListNode(HashtableList* htlist, HashtableListNodeIt parent, const hkey_t* key                ){
#endif
    assert(htlist != NULL);
    
    if(htlist->free == 0) expandHashtableList(htlist); 
    HashtableListNodeIt node = htlist->free;

    HashtableListNode* ptr = htlist->data + node;
    htlist->free = ptr->next;

    if(key != NULL){
    
    #ifdef HMAP
        assert(data != NULL);
        memcpy(&(ptr->data), data, sizeof(data_t));
    #endif
        memcpy(&(ptr->key ), key, sizeof(hkey_t));
        ptr->isFictive = 0;
    }
    else{
        ptr->isFictive = 1;
    }

    if(parent == 0){
        ptr->next = htlist->root;
        htlist->root = node;
    }
    else{
        ptr->next = htlist->data[parent].next;
        htlist->data[parent].next = node;
    }
    return node;
}

void expandHashtableList(HashtableList* htlist){
    assert(htlist != NULL);
    assert(htlist->capacity != 0);

    HashtableListNode* newData = (HashtableListNode*) aligned_alloc(32, 2 * htlist->capacity * sizeof(HashtableListNode));
    memset(newData + htlist->capacity, 0, htlist->capacity * sizeof(HashtableListNode));
    memcpy(newData, htlist->data, htlist->capacity * sizeof(HashtableListNode));
    free(htlist->data);
    htlist->data = newData;
    assert(htlist->data != NULL);
    htlist->data[htlist->capacity].next = 0;
    for(size_t it = htlist->capacity + 1; it < htlist->capacity * 2; ++it){
        htlist->data[it].next = it - 1;
    }
    htlist->free = (htlist->capacity *= 2) - 1;
}

void initHashtableList(HashtableList* htlist){
    htlist->data = (HashtableListNode*) aligned_alloc(32, HTLIST_INIT_SZ * sizeof(HashtableListNode));
    memset(htlist->data, 0, HTLIST_INIT_SZ * sizeof(HashtableListNode));
    assert(htlist->data != NULL);
    htlist->capacity = HTLIST_INIT_SZ;
    for(size_t it = 1; it < htlist->capacity; ++it){
        htlist->data[it].next = it - 1;
    }
    htlist->free = HTLIST_INIT_SZ - 1;
    htlist->data[0].isFictive = 1;
    htlist->data[0].cnt  = 0;
    htlist->data[0].next = 0;
}


void dumpHashtable(const Hashtable* ht, void (*pf_k)(const hkey_t*), void (*pf_d)(const data_t*)){
    assert(ht != NULL);
    assert(pf_k != NULL);
    assert(pf_d != NULL);

    printf("HashTable at [%p]{      \n", ht                     );
    printf("    .capacity = %zu     \n", ht->capacity           );
    printf("    .size = %zu         \n", ht->size               );
    printf("    .data = %p          \n", ht->data               );
    printf("    .htlist = {         \n"                         );
    printf("        .root = %zu     \n", ht->htlist.root        );
    printf("        .free = %zu     \n", ht->htlist.free        );
    printf("        .capacity = %zu \n", ht->htlist.capacity    );
    printf("        .data = %p      \n", ht->htlist.data        );
    printf("    }                   \n"                         );
    printf("    DATA_DUMPING:       \n"                         );

    for(size_t i = 0; i < ht->capacity; ++i){
        printf("    [%4zu]: ", i);
        if(ht->data[i] == 0){
            printf("EMPTY\n");
            continue;
        }
        printf("<%4zu> ...->\n", ht->htlist.data[ht->data[i]].cnt);
        for(HashtableListNodeIt it = ht->htlist.data[ht->data[i]].next; !ht->htlist.data[it].isFictive; it = ht->htlist.data[it].next){
            printf("        ...-> [%4zu]{\n", it);
            printf("             .key: ");
            pf_k(&ht->htlist.data[it].key);
            printf("\n             .data:");
            pf_d(&ht->htlist.data[it].data);
            printf("\n    } -> ...\n");
        }
    }

    printf("}\n");

}

void freeHashtableList(HashtableList* htlist){
    if(htlist == NULL) return;
    free(htlist->data);
    htlist->free = 0;
    htlist->capacity = 0;
    htlist->root = 0;
}

void deleteNextHashtableNode(HashtableList* htlist, HashtableListNodeIt node){
    assert(htlist != NULL);
    assert(htlist->data[node].next != 0);
    HashtableListNodeIt next = htlist->data[node].next;
    htlist->data[node].next = htlist->data[next].next;
    htlist->data[next].next = htlist->free;
    htlist->free = next;
}

Hashtable* createHashtable(size_t initCapacity){
    Hashtable* ht = (Hashtable*) calloc(1, sizeof(Hashtable));
    assert(ht != NULL);
    initHashtableList(&ht->htlist);
    ht->data = (HashtableListNodeIt*) calloc(initCapacity, sizeof(HashtableListNodeIt));
    assert(ht->data != NULL);
    ht->capacity = initCapacity;
    return ht;
}

void deleteHashtable(Hashtable* ht){
    assert(ht != NULL);
    freeHashtableList(&ht->htlist);
    free(ht->data);
    free(ht);
}

size_t defaultHash(const hkey_t* key){
    unsigned hash = 0;
    for(size_t i = 0; i < sizeof(hkey_t); ++i){
        hash = _mm_crc32_u8(hash, ((const unsigned char*)key)[i]);
    }
    return hash;
}

size_t stringHash(const hkey_t* key){
    unsigned hash = 0;
    for(size_t i = 0; i < sizeof(hkey_t) && ((const char*)key)[i] != '\0'; ++i){
        hash = _mm_crc32_u8(hash, ((const unsigned char*)key)[i]);
    }
    return hash;
}

#ifdef HMAP
data_t* findHashtable(const Hashtable* ht, const hkey_t* key){
#else
int     findHashtable(const Hashtable* ht, const hkey_t* key){
#endif
    HashtableListNodeIt it = ht->data[HASH(key) % ht->capacity];
#ifdef HMAP
    if(it == 0) return NULL;
#else
    if(it == 0) return 0;
#endif

    it = ht->htlist.data[it].next;
    while(!ht->htlist.data[it].isFictive){
        if(EQ(key, &ht->htlist.data[it].key)){
        #ifdef HMAP
            return &ht->htlist.data[it].data;
        #else
            return 1;
        #endif
        }
        it = ht->htlist.data[it].next;
    }
#ifdef HMAP
    return NULL;
#else
    return 0;
#endif
}

#ifdef HMAP
int insertHashtable(Hashtable* ht, const hkey_t* key, const data_t* data){
#else
int insertHashtable(Hashtable* ht, const hkey_t* key                ){
#endif
    
    size_t hash = HASH(key) % ht->capacity;
    HashtableListNodeIt it = ht->data[hash];
    if(it == 0){
    #ifdef HMAP
        ht->data[hash] = insertHashtableListNode(&ht->htlist, 0, NULL, NULL);
    #else
        ht->data[hash] = insertHashtableListNode(&ht->htlist, 0, NULL      );
    #endif
        ht->htlist.data[ht->data[hash]].cnt = 1;
    }
    it = ht->htlist.data[it].next;
    while(!ht->htlist.data[it].isFictive){
        if(EQ(key, &ht->htlist.data[it].key)){
        #ifdef HMAP
            memcpy(&ht->htlist.data[it].data, data, sizeof(data_t));
        #endif
            return 0;
        }
        it = ht->htlist.data[it].next;
    }
    #ifdef HMAP
    insertHashtableListNode(&ht->htlist, ht->data[hash], key, data);
    #else
    insertHashtableListNode(&ht->htlist, ht->data[hash], key);
    #endif
    ht->size++;
    ht->htlist.data[ht->data[hash]].cnt++;
    return 1;
}

int removeHashtable(Hashtable* ht, const hkey_t* key){
    HashtableListNodeIt it = ht->data[HASH(key) % ht->capacity];
    if(it == 0) return 0;
    
    HashtableListNodeIt prev = it;
    it = ht->htlist.data[it].next;
    while(!ht->htlist.data[it].isFictive){
        if(EQ(key, &ht->htlist.data[it].key)){
            deleteNextHashtableNode(&ht->htlist, prev);
            ht->size--;
            return 1;
        }
        prev = it;
        it = ht->htlist.data[it].next;
    }
    return 0;
}

void clearHashtable(Hashtable* ht){
    assert(ht != NULL);
    for(HashtableListNodeIt it = ht->htlist.root; it != 0; it = ht->htlist.data[it].next){
        while(!ht->htlist.data[ht->htlist.data[it].next].isFictive){
            deleteNextHashtableNode(&ht->htlist, it);
        }
    }
    ht->size = 0;
}


inline size_t OneHash(const hkey_t*){
    return 1;
}

inline size_t s0Hash(const hkey_t* key){
    return (unsigned char)key->s[0];
}

size_t EsHash(const hkey_t* key){
    size_t s = 0;
    asm(
        ".intel_syntax noprefix\n\t"
        "mov rsi, %1\n\t"
        "xor rdi, rdi\n\t"
        "xor rax, rax\n\t"
        "mov rcx, 32\n\t"
        "abobalopper%=:\n\t"
        "lodsb\n\t"
        "add rdi, rax\n\t"
        "loop abobalopper%=\n\t"
        "mov %0, rdi\n\t"
        ".att_syntax\n\t" : "=r"(s) : "r"(key) : "rsi", "rdi", "rcx", "rax"
    );
    return s;
}