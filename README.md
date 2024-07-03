# MyERC20Token

A simple ERC20 token contract implemented in Solidity.

## Contract Details

* **Name:** DOB-DOB
* **Symbol:** DD
* **Decimals:** 18
* **Total Supply:** 0 (initially, can be increased through minting)

## Functionality

### Minting

* Only the contract owner can mint new tokens.
* The `mint` function increases the total supply and adds the minted tokens to the specified address.

### Transferring

* Anyone can transfer tokens from one address to another.
* The `transfer` function checks for sufficient balance and updates the balances accordingly.

### Burning

* Anyone can burn tokens from their own address.
* The `burn` function checks for sufficient balance and updates the total supply and balances accordingly.

### Balance Inquiry

* The `balanceOf` function returns the token balance of a specified address.

## Security

* The contract uses the `require` statement to ensure that only the contract owner can mint tokens.
* The contract uses the `require` statement to ensure that the sender has sufficient balance before transferring or burning tokens.

## Deployment

* This contract can be deployed to the Ethereum blockchain using a compatible wallet or deployment tool.


## License

* This contract is licensed under the MIT License.
