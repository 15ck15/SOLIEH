// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IUltraCounter
/// @notice Interface for UltraCounter.
interface IUltraCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
