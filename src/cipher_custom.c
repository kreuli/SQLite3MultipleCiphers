/*
** Name:        cipher_custom.c
** Purpose:     Interface to custom encryption algorithm
** Author:      Ulrich Kreuzeder
** Created:     2022-06-15
** Copyright:   (c) 2006-2022 Ulrich Telle
** License:     MIT
*/

#include "cipher_common.h"

/* -- Custom cipher (bring-your-own) --- */
#if HAVE_CIPHER_CUSTOM

#include "cipher_custom.h"

/*
** Configuration parameters for "custom" cipher
**
** - legacy mode : compatibility with System.Data.SQLite encryption
**                 (page 1 fully encrypted)
**                 only legacy mode is supported
**                 possible value:  1 = yes
*/

SQLITE_PRIVATE CipherParams mcCustomParams[] =
{
  { "legacy", 0, 0, 0, 1},
  CIPHER_PARAMS_SENTINEL
};


static void GenerateKeyCustomCipherProxy(void* cipher, BtShared* pBt, char* userPassword, int passwordLength, int rekey, unsigned char* cipherSalt)
{
    GenerateKeyCustomCipher(cipher, (void *)pBt, userPassword, passwordLength, rekey, cipherSalt);
}

SQLITE_PRIVATE const CipherDescriptor mcCustomDescriptor =
{
  "custom", AllocateCustomCipher,
            FreeCustomCipher,
            CloneCustomCipher,
            GetLegacyCustomCipher,
            GetPageSizeCustomCipher,
            GetReservedCustomCipher,
            GetSaltCustomCipher,
            GenerateKeyCustomCipherProxy,
            EncryptPageCustomCipher,
            DecryptPageCustomCipher
};
#endif
