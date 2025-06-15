// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRoyalToken
/// @notice Interface for RoyalToken.
interface IRoyalToken {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
