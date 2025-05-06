// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title AmberCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract AmberCounter {
    uint256 public constant LIMIT = 1000;
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

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }
}
