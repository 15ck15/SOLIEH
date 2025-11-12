// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IEmberSplitter
/// @notice Interface for EmberSplitter.
interface IEmberSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
