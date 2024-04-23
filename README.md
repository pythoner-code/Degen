# Degen

## Points Token Contract

## Overview
The `Points` smart contract implements an ERC-20 token with additional features allowing token burning, minting by the owner, and user level upgrades based on token redemption amounts. This contract is suitable for applications requiring a tiered access or reward system based on token holdings.

## Contract Features
- **ERC-20 Token:** Standard token functionalities such as transfer, balance checks, and allowances.
- **Token Minting:** Only the owner of the contract can mint new tokens.
- **Token Burning:** Users can burn tokens to decrease supply and potentially increase value or change membership levels.
- **Membership Levels:** Users can upgrade their membership levels by redeeming tokens.

## Token Details
- **Name:** Degen
- **Symbol:** DGN
- **Decimals:** 18

## Functions

### Public and External
- **mint(address to, uint256 amount):** Allows the owner to mint tokens to a specified address.
- **burnTokens(uint256 _value):** Allows a user to burn their tokens to reduce total supply.
- **redeemTokens(uint256 _value):** Allows users to redeem tokens for upgrading their membership level.
- **transferTokens(address _rec, uint256 _value):** Allows a user to transfer their tokens to another address.
- **getBalance():** Returns the balance of the caller.
- **getUserLevel(address user):** Returns the membership level of a specified user.

### Only Owner
- **mint:** This function can only be used by the owner to add tokens to any address.

## Usage
To interact with the deployed Points contract, you can use Truffle or set up a web interface using libraries such as Web3.js or Ethers.js.

## Security Considerations
- **Access Control:** Ensure that minting functions are properly protected to prevent unauthorized token creation.
- **Input Validation:** Check inputs in functions like `transferTokens` to avoid exceptions and unintended transfers.

## License
This project is licensed under the MIT License.

---
