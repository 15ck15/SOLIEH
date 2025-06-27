// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAmberCounter
/// @notice Interface for AmberCounter.
interface IAmberCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
