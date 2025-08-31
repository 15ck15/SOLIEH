// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRavenSplitter
/// @notice Interface for RavenSplitter.
interface IRavenSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
