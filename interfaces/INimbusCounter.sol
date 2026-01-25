// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INimbusCounter
/// @notice Interface for NimbusCounter.
interface INimbusCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
