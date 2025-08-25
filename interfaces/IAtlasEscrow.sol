// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAtlasEscrow
/// @notice Interface for AtlasEscrow.
interface IAtlasEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
