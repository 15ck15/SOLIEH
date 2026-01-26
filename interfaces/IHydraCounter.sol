// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IHydraCounter
/// @notice Interface for HydraCounter.
interface IHydraCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
