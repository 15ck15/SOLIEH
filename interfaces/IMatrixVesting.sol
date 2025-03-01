// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMatrixVesting
/// @notice Interface for MatrixVesting.
interface IMatrixVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
