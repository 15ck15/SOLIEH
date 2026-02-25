// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAlphaEscrow
/// @notice Interface for AlphaEscrow.
interface IAlphaEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
