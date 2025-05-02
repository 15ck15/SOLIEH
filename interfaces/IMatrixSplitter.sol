// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMatrixSplitter
/// @notice Interface for MatrixSplitter.
interface IMatrixSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
