// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

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
