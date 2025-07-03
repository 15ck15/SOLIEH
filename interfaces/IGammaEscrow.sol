// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IGammaEscrow
/// @notice Interface for GammaEscrow.
interface IGammaEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
