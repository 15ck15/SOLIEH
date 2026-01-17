// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVectorVesting
/// @notice Interface for VectorVesting.
interface IVectorVesting {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
