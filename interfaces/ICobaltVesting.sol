// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICobaltVesting
/// @notice Interface for CobaltVesting.
interface ICobaltVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
