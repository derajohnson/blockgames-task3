//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract PurpleToken is ERC20, Ownable {

    uint256 private fixedTotalSupply = 1000000;
    uint256 public rate = 1000 * 10 ** decimals();

    mapping(address => uint256) private _balances;

    constructor() ERC20("PurpleToken", "PLE") {
         _mint(msg.sender, fixedTotalSupply * 10 ** decimals());
    }

 function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address payable reciever) public payable {
        uint256 token = rate * msg.value;
        _balances[reciever] += token;
        fixedTotalSupply += token;     
    }
}