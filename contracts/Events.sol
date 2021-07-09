// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "../.deps/npm/@openzeppelin/contracts/access/Ownable.sol";

contract Events  {
    event AllowanceChanged(address indexed _to, address indexed _from, uint _oldAllowance, uint newAllowance);
    event MoneyRecieved(address sender, uint _amount);
    event MoneySent(address sender, uint _amount);
}