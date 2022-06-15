/*
** Name:        cipher_custom.h
** Purpose:     Interface to custom encryption algorithm
** Author:      Ulrich Kreuzeder
** Created:     2022-06-15
** Copyright:   (c) 2006-2022 Ulrich Telle
** License:     MIT
*/

#include "cipher_common.h"

/*
   --- Bring-Your-Own-Cipher --- 

   Per default, s
*/
#if HAVE_CIPHER_CUSTOM

/*
** Example for a cipher structure, to be defined the the user of this functionlity.

typedef struct _CustomCipher
{
  int       m_keyLength;
  uint8_t   m_key[KEY_SIZE_OF_THE_CUSTOM_ALG];
  void*     m_custom;
} CustomCipher;
*/

/* The following methods must be implemented by the user of this functionality */
extern void* AllocateCustomCipher(sqlite3* db);
extern void FreeCustomCipher(void* cipher);
extern void CloneCustomCipher(void* cipherTo, void* cipherFrom);
extern int GetPageSizeCustomCipher(void* cipher);
extern unsigned char* GetSaltCustomCipher(void* cipher);
extern void GenerateKeyCustomCipher(void* cipher, BtShared* pBt, char* userPassword, int passwordLength, int rekey, unsigned char* cipherSalt);
extern int EncryptPageCustomCipher(void* cipher, int page, unsigned char* data, int len, int reserved);
extern int DecryptPageCustomCipher(void* cipher, int page, unsigned char* data, int len, int reserved, int hmacCheck);

#endif
