// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISwiftEscrow
/// @notice Interface for SwiftEscrow.
interface ISwiftEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
