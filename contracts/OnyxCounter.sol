// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OnyxCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract OnyxCounter {
    uint256 public constant LIMIT = 10000;
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

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }
}
