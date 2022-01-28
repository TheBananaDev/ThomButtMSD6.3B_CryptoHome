# ThomButtMSD6.3B_CryptoHome
Repository for the ITBCK-606-2101 (Blockchain) unit, Assignment 2 (Home Assignment) component by Thomas Buttigieg (MSD 6.3B)

Define the difference between storing variables on memory or on storage [2 marks]

Storage is where all contracts reside and is persistent between function calls. Any memory call made to storage automatically writes it to the blockchain. Reading from storge is expensive and should thus only be used if necessary. Memory holds temporary values that are erased in between function calls and not saved to the blockchain. Reading from memory is not expensive and is thus used more often.

Source 1: https://medium.com/coinmonks/ethereum-solidity-memory-vs-storage-which-to-use-in-local-functions-72b593c3703a
Source 2: https://dlt-repo.net/storage-vs-memory-vs-stack-in-solidity-ethereum/