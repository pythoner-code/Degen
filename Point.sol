// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Points is ERC20, Ownable {

    enum Level { Level1, Level2, Level3 }

    mapping(address => Level) public userLevels;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender){
        
    }

    function redeemTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient Balance");
        require(_value >= 200, "Minimum redeem value is 200");
        _burn(msg.sender, _value);

        if (_value >= 500) {
            userLevels[msg.sender] = Level.Level3;
        } else if (_value >= 200) {
            userLevels[msg.sender] = Level.Level2;
        } else {
            userLevels[msg.sender] = Level.Level1;
        }
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender); 
    }

    function transferTokens(address _rec, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You dont have enough tokens");
        _transfer(msg.sender, _rec, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value,"You dont have enough tokens to burn");
        _burn(msg.sender, _value);
    }

    function getUserLevel(address user) external view returns (Level) {
        return userLevels[user];
    }
}
