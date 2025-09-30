// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SigmaBytes
/// @notice Reusable helper functions.
library SigmaBytes {
    function hash(string memory value) internal pure returns (bytes32) {
        return keccak256(bytes(value));
    }

    function hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a < b ? keccak256(abi.encodePacked(a, b)) : keccak256(abi.encodePacked(b, a));
    }
}
