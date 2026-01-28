// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IKrakenEscrow
/// @notice Interface for KrakenEscrow.
interface IKrakenEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
