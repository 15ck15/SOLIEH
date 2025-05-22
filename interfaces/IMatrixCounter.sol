// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMatrixCounter
/// @notice Interface for MatrixCounter.
interface IMatrixCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
