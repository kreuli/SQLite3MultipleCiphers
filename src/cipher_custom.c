/*
** Name:        cipher_custom.c
** Purpose:     Interface to custom encryption algorithm
** Author:      Ulrich Kreuzeder
** Created:     2022-06-15
** Copyright:   (c) 2006-2022 Ulrich Telle
** License:     MIT
*/

#include "cipher_common.h"

/* --- AES 256-bit cipher (wxSQLite3) --- */
#if HAVE_CIPHER_CUSTOM

#include "cipher_custom.h"

static int 
GetLegacyCustomCipher(void* cipher)
{
  return 0;
}

static int
GetReservedCustomCipher(void* cipher)
{
  return 0;
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
            GenerateKeyCustomCipher,
            EncryptPageCustomCipher,
            DecryptPageCustomCipher
};
#endif
