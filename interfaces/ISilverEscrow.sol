// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISilverEscrow
/// @notice Interface for SilverEscrow.
interface ISilverEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
