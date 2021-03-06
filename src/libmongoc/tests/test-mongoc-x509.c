#include <mongoc/mongoc.h>
#include "mongoc/mongoc-ssl-private.h"

#include "TestSuite.h"

#if defined(MONGOC_ENABLE_SSL) && !defined(MONGOC_ENABLE_SSL_LIBRESSL)
static void
test_extract_subject (void)
{
   char *subject;

   subject = mongoc_ssl_extract_subject (CERT_SERVER, NULL);
   ASSERT_CMPSTR (
      subject,
      "C=US,ST=New York,L=New York City,O=MongoDB,OU=Drivers,CN=localhost");
   bson_free (subject);

   subject = mongoc_ssl_extract_subject (CERT_CLIENT, NULL);
   ASSERT_CMPSTR (
      subject, "C=US,ST=New York,L=New York City,O=MDB,OU=Drivers,CN=client");
   bson_free (subject);
}
#endif


void
test_x509_install (TestSuite *suite)
{
#if defined(MONGOC_ENABLE_SSL) && !defined(MONGOC_ENABLE_SSL_LIBRESSL)
   TestSuite_Add (suite, "/X509/extract_subject", test_extract_subject);
#endif
}
