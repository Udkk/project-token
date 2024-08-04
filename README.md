This Solidity contract represents a basic implementation of an ERC20 token named "DOB-DOB" (symbol: "DD"). It demonstrates essential ERC20 token functionalities such as minting, transferring, and burning tokens. This contract can be a useful reference for understanding the foundational elements of ERC20 tokens and Solidity programming.

Description
The MyERC20Token contract provides a simplified ERC20 token implementation. It includes functions for minting new tokens, transferring tokens between addresses, and burning tokens to reduce the total supply. The contract is designed to help developers grasp the core concepts of ERC20 tokens and can be extended or customized for more advanced use cases.

Key Features
Minting: Allows the contract owner to create new tokens and assign them to a specific address.
Transferring: Enables the transfer of tokens from one address to another.
Burning: Permits the reduction of the total token supply by destroying tokens from a specified address.
Balance Checking: Provides a method to check the token balance of a specific address.
Getting Started
Executing the Contract
To deploy and interact with the MyERC20Token contract, you can use Remix, an online Solidity IDE. Follow these steps to get started:

Open Remix: Visit Remix IDE.

Create a New File: Click the "+" icon in the left sidebar and save the file with a .sol extension (e.g., MyERC20Token.sol).

Paste the Code: Copy and paste the following code into the file:

solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token {
    mapping (address => uint256) public balances;
    
    string public name;
    string public symbol;
    uint8 public decimals;
    address public owner;
    uint256 public totalSupply;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        name = "DOB-DOB";
        symbol = "DD";
        decimals = 18;
        owner = msg.sender;
        totalSupply = 0;
    }

    function mint(address _to, uint256 _value) public {
        require(msg.sender == owner, "Only the contract owner can mint tokens");
        totalSupply += _value;
        balances[_to] += _value;
        emit Mint(_to, _value);
    }

    function transfer(address _from, address _to, uint256 _value) public {
        require(balances[_from] >= _value, "Insufficient balance");
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
    }

    function burn(address _from, uint256 _value) public {
        require(balances[_from] >= _value, "Insufficient balance");
        balances[_from] -= _value;
        totalSupply -= _value;
        emit Burn(_from, _value);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}
Compile the Code: Click on the "Solidity Compiler" tab in the left sidebar. Ensure the compiler version is set to 0.8.26 or another compatible version, and then click on "Compile MyERC20Token.sol".

Deploy the Contract: Navigate to the "Deploy & Run Transactions" tab. Select the MyERC20Token contract from the dropdown menu and click "Deploy".

Interact with the Contract: Once deployed, you can interact with the contract through the Remix interface:

Use the mint function to create new tokens.
Use the transfer function to move tokens between addresses.
Use the burn function to destroy tokens.
Check balances with the balanceOf function.
Author
Udit Kumar

License
This project is licensed under the MIT License.

