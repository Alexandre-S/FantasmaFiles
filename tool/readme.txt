DSCreateKey / DSCheckSignatures
===============================
Copyright (c) 2007 Bohemia Interactive a.s. All rights reserved.

For more information about ArmA digital signatures system please visit http://community.bistudio.com/wiki/Armed_Assault:_Addon_Signatures

This tool is released for addon makers in order to allow them to generate their own digital signatures (private and public keys) to be used for signing data packages for ArmA.

DSCreateKey
===========

Usage: DSCreateKey <authorityname>

It will generate private and public keys (authorityname.biprivatekey authorityname.bikey ).

Authority name is the name of signing authority, usually the author of addons to be signed. Using TAG is recommended practice. The name itself serves only to identify the group.

IMPORTANT: Make sure to protect your private key well. Only public keys can be distributed with your content to public.


DSCheckSignatures
=================

Usage: DSCheckSignatures <checked directory> <keys directory>

The utility will verify if all files in the given directory are signed by one of keys from the keys directory.