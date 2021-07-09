// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Allowances.sol";

contract SharedWallet is Allowances {
    
  function withdraw (address payable _to, uint _amount) public onlyOwner {
      require(getContractBalance() >= _amount, "Not enough money in account to withdraw");
      _to.transfer(_amount);
   }
  
   function withdrawAllowance(address payable _withdrawTo, uint _amount) public {
     require(allowances[msg.sender] >= _amount, "Not enough withdraw allownce in your account");

     decreaseAllowanceTotal(_amount);
     
     emit AllowanceChanged(_withdrawTo, msg.sender, allowances[msg.sender], allowances[msg.sender] - _amount);
     allowances[msg.sender] -= _amount;
     
     emit MoneySent(_withdrawTo, _amount);
     _withdrawTo.transfer(_amount);
   }
  
    receive() external payable {
        emit MoneyRecieved(msg.sender, msg.value);
    }
    
    fallback() external payable {}
    
    function renounceOwnership() override public view onlyOwner {
       revert("Can't renounce ownership");
    }
 
}

