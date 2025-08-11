// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IGoldenEscrow
/// @notice Interface for GoldenEscrow.
interface IGoldenEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
