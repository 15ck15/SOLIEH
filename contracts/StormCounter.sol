// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title StormCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract StormCounter {
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

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }
}
