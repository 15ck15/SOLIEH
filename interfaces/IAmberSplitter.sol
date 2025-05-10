// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAmberSplitter
/// @notice Interface for AmberSplitter.
interface IAmberSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
