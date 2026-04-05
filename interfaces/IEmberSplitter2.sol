// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IEmberSplitter2
/// @notice Interface for EmberSplitter2.
interface IEmberSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
