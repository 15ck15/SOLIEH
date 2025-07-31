// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPrimeCounter
/// @notice Interface for PrimeCounter.
interface IPrimeCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
