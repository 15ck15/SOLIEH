// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IFrostEscrow
/// @notice Interface for FrostEscrow.
interface IFrostEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
