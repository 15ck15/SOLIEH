// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title AuroraCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract AuroraCounter {
    uint256 public constant LIMIT = 500;
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

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "AuroraCounter";
    }
}
