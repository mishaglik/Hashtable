#ifndef HASHTABLE_HASHTABLE_H
#define HASHTABLE_HASHTABLE_H
/**
 * @file main.c
 * @author Glinskii Mikhail (B05-133)
 * @brief 
 * @version 0.1
 * @date 2022-02-07
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <nmmintrin.h>
#include <immintrin.h>

#include <stdlib.h>
#define HMAP
const size_t WORDLEN = 30;
typedef struct{char s[32];} word;

typedef word hkey_t;
#ifdef HMAP
typedef size_t data_t;
#endif
typedef size_t HashtableListNodeIt;

// #define HASH(x) defaultHash(x)
#define HASH(x) stringHash(x)

// #define HASH(x) OneHash(x)
// #define HASH(x) s0Hash(x)
// #define HASH(x) EsHash(x)
// #define HASH(x) strnlen((const char*)x, 32)
// #define HASH(x) rotHash(x)
// #define EQ(x, y) !memcmp((x), (y), sizeof(hkey_t))
#define EQ(x, y) !strncmp((const char*)(x), (const char*)(y), sizeof(hkey_t))


#pragma pack(1)
struct HashtableListNode
{
    hkey_t key;
#ifdef HMAP
    data_t data;
#endif
    HashtableListNodeIt next;
    int isFictive;                  // Change to optimize; Looked in prof
    size_t cnt;
    char _[4];
};
#pragma pack(0)
typedef struct HashtableListNode HashtableListNode;

const size_t HTLIST_INIT_SZ = 1000;

struct HashtableList
{
    HashtableListNodeIt root;
    HashtableListNodeIt free;
    size_t capacity;
    HashtableListNode* data;
};
typedef struct HashtableList HashtableList;
void initHashtableList(HashtableList* htlist);

void expandHashtableList(HashtableList* htlist);


void freeHashtableList(HashtableList* htlist);

#ifdef HMAP
HashtableListNodeIt insertHashtableListNode(HashtableList* htlist, HashtableListNodeIt parent, const hkey_t* key, const data_t* data);
#else
HashtableListNodeIt insertHashtableListNode(HashtableList* htlist, HashtableListNodeIt parent, const hkey_t* key               );
#endif

void deleteNextHashtableNode(HashtableList* htlist, HashtableListNodeIt node);

struct Hashtable
{
    HashtableList htlist;
    HashtableListNodeIt* data;
    size_t size;
    size_t capacity;
};
typedef struct Hashtable Hashtable;

Hashtable* createHashtable(size_t initCapacity);
void deleteHashtable(Hashtable* ht);

inline size_t defaultHash(const hkey_t* key);

inline size_t stringHash(const hkey_t* key);

inline size_t OneHash(const hkey_t* key);
inline size_t s0Hash(const hkey_t* key);
size_t EsHash(const hkey_t* key);
size_t rotHash(const hkey_t* key);


#ifdef HMAP
int insertHashtable(Hashtable* ht, const hkey_t* key, const data_t* data);
#else
int insertHashtable(Hashtable* ht, const hkey_t* key               );
#endif
#ifdef HMAP
data_t* findHashtable(const Hashtable* ht, const hkey_t* key);
#else
int findHashtable(const Hashtable* ht, const hkey_t* key);
#endif
int removeHashtable(Hashtable* ht, const hkey_t* key);

void clearHashtable(Hashtable* ht);

#ifdef HMAP
void dumpHashtable(const Hashtable* ht, void (*pf_k)(const hkey_t*), void (*pf_d)(const data_t*));
#else
void dumpHashtable(const Hashtable* ht, void (*pf)(const hkey_t* key));
#endif


#endif