// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVectorEscrow
/// @notice Interface for VectorEscrow.
interface IVectorEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
