// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPixelEscrow
/// @notice Interface for PixelEscrow.
interface IPixelEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
