// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title QuantumCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract QuantumCounter {
    uint256 public constant LIMIT = 5000;
    uint256 public count;

    event CountChanged(uint256 newCount);

    function increment() external {
        require(count < LIMIT, "limit reached");
        count += 1;
        emit CountChanged(count);
    }

    function decrement() external {
        require(count > 0, "already zero");
        count -= 1;
        emit CountChanged(count);
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }
}
