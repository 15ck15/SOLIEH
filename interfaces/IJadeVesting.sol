// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IJadeVesting
/// @notice Interface for JadeVesting.
interface IJadeVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
