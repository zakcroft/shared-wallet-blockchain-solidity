// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "/Users/zak/Dropbox/dapps/udemy-shared-wallet/.deps/npm/@openzeppelin/contracts/access/Ownable.sol";

import "./Events.sol";

contract Allowances is Ownable, Events  {
    
    mapping(address => uint) public allowances;
    uint public allowancesTotal;
    
    function decreaseAllowanceTotal(uint _amount) internal {
      allowancesTotal -= _amount;
    }
  
    function increaseAllowanceTotal(uint _amount) internal {
      allowancesTotal += _amount;
    }
    
    function setAllowance(address _for, uint _amount) public onlyOwner {
      require(getContractBalance() >= _amount, "Not enough money in account to set allownce");
      require(getContractBalance() >= allowancesTotal + _amount, "Not enough money in account to set allownce");
      
      increaseAllowanceTotal(_amount);
      
      emit AllowanceChanged(_for, msg.sender, allowances[_for], allowances[_for] + _amount);
      
      allowances[_for] = _amount;
    }
    
    function getContractBalance() public view returns(uint) {
      return address(this).balance;
    }
  
}