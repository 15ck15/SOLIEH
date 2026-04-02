// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IOmegaEscrow
/// @notice Interface for OmegaEscrow.
interface IOmegaEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
