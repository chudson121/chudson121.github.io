---
layout: post
title: "PCI Storing credit card numbers aka PAN"
description: "PCI requirements for storing full credit card numbers (PCI DSS 3.2)"
categories: PCI, Card payments
author: "Chris Hudson"
meta: "PCI, PAN, Storage, card payments"
---

Here is a summary from [PCI Guidelines](https://www.pcisecuritystandards.org/pdfs/pci_fs_data_storage.pdf) 

# Impacts
- Storing PAN data increases your organization’s scope of compliance to PCI related laws and guidelines.
- If required for business purposes, the cardholder’s name, PAN, expiration date, and service code may be stored as long as they are protected in accordance with PCI DSS requirements.
- Merchants should develop a data retention and storage policy that strictly limits storage amount and retention time to that which is required for business, legal, and/or regulatory purposes.
- Sensitive authentication data must never be stored after authorization – even if this data is encrypted. 
- Sensitive Authentication Data defined as
	- Full Magnetic Stripe Data
	- CAV2/CVC2/CVV2/CID
	- PIN/PIN Block
- These data elements must be protected if stored in conjunction with the PAN. 
	- Cardholder Name
	- Service Code
	- Expiration Date

This protection should be per PCI DSS requirements for general protection of the cardholder data environment. 
Additionally, other legislation (e.g., related to consumer personal data protection, privacy, identity theft, or data security) may require specific protection of this data, or proper disclosure of a company’s practices if consumer related personal data is being collected during the course of business. 

# Unreadable at rest (in a table, file, etc) 
- At a minimum, PCI DSS requires PAN to be rendered unreadable anywhere it is stored 
	- including portable digital media, 
	- backup media, 
	- and in **logs** (SUPER careful here it is easy to get this info into the log systems!!!). 
- Software solutions for this requirement may include one of the following:
	- One-way hash functions based on strong cryptography – also called hashed index, which displays only index data that point to records in the database where sensitive data actually reside.
	- Truncation – removing a data segment, such as showing only the last four digits.
	- Index tokens and securely stored pads – encryption algorithm that combines sensitive plain text data with a random key or “pad” that works only once.
	- Strong cryptography – with associated key management processes and procedures. Refer to the PCI DSS and PA-DSS Glossary of Terms, Abbreviations and Acronyms for the definition of “strong cryptography.”

# Strong Cyptography 
- Some cryptography solutions encrypt specific fields of information stored in a database; others encrypt a singular file or even the entire disk where data is stored. For more details, see PCI DSS Requirement 3.
	- If full-disk encryption is used, Logical access must be managed independently of native operating system access control mechanisms. 
	- Decryption keys must not be tied to user accounts. 
	- Encryption keys used for encryption of cardholder data must be protected against both disclosure and misuse. 
	- All key management processes and procedures for keys used for encryption of cardholder data must be fully documented and implemented. 
	- Do use strong cryptography to render unreadable cardholder data that you store, and use other layered security technologies to minimize the risk of exploits by criminals (see NIST key management guidelines https://csrc.nist.gov/Projects/Key-Management/Key-Management-Guidelines)

# DO NOT STORE EVER!	 
- Never store the card-validation code or value (three- or four-digit number printed on the front or back of a payment card used to validate card-not-present transactions).
- Never store the personal identification number (PIN) or PIN Block. Be sure to mask PAN whenever it is displayed. 

# Other Do NOTS!
- Do not locate servers or other payment card system storage devices outside of a locked, fully secured and access-controlled room
- Do not permit any unauthorized people to access stored cardholder data

# But, i need to see some of the digits....
The first six and last four digits are the maximum number of digits that may be displayed. 
This requirement does not apply to those authorized with a specific need to see the full PAN, nor does it supersede stricter requirements in place for displays of cardholder data such as on a point-of-sale receipt
