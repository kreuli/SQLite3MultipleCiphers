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

SQLite3MultipleCiphers has built-in encryption: for AES128, AES256, RC4, ChaCha20, SQLCipher.
If you want to use your own encryption routines (either if you want to use a different
algorithm or a different implementation), build with "HAVE_CIPHER_CUSTOM = 1" and:

1. In your own code, implement the external methods below, adding your crypto.
   You can use the implementation of the builtin algorithms as a template, e.g. cipher_sds_rc4.c.

2. In your own code, set the "cipher" parameter to "CODEC_TYPE_CUSTOM" after opening the DB, e.g.:
   sqlite3mc_config(m_db, "cipher", CODEC_TYPE_CUSTOM).

NOTE: As custom cipher mode relies on external symbols, unresolved at link time,
      HAVE:CIPHER_CUSTOM is only supported when creating a static library!
*/

#if HAVE_CIPHER_CUSTOM

/*
The external methods below must be implemented by you, when compiling with HAVE_CIPHER_CUSTOM.
*/
extern int GetLegacyCustomCipher(void* cipher);
extern int GetPageSizeCustomCipher(void* cipher);
extern int GetReservedCustomCipher(void* cipher);
extern void* AllocateCustomCipher(sqlite3* db);
extern void FreeCustomCipher(void* cipher);
extern void CloneCustomCipher(void* cipherTo, void* cipherFrom);
extern unsigned char* GetSaltCustomCipher(void* cipher);
extern void GenerateKeyCustomCipher(void* cipher, void* pBt, char* userPassword, int passwordLength, int rekey, unsigned char* cipherSalt);
extern int EncryptPageCustomCipher(void* cipher, int page, unsigned char* data, int len, int reserved);
extern int DecryptPageCustomCipher(void* cipher, int page, unsigned char* data, int len, int reserved, int hmacCheck);

#endif
