// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBrightVesting
/// @notice Interface for BrightVesting.
interface IBrightVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
