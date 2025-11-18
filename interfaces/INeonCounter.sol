// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INeonCounter
/// @notice Interface for NeonCounter.
interface INeonCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
