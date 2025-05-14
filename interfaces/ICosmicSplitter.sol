// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICosmicSplitter
/// @notice Interface for CosmicSplitter.
interface ICosmicSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
