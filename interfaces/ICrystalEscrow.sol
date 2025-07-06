// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICrystalEscrow
/// @notice Interface for CrystalEscrow.
interface ICrystalEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
