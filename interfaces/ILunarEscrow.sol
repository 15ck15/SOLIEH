// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ILunarEscrow
/// @notice Interface for LunarEscrow.
interface ILunarEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
