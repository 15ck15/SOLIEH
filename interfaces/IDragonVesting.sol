// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IDragonVesting
/// @notice Interface for DragonVesting.
interface IDragonVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
