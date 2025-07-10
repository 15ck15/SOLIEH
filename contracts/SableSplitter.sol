// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SableSplitter
/// @notice Two-party payment splitter.
/// @custom:kind splitter
contract SableSplitter {
    address payable public immutable partyA;
    address payable public immutable partyB;
    uint256 public immutable shareA;

    event Received(address indexed from, uint256 amount);
    event Distributed(uint256 toA, uint256 toB);

    constructor(address payable a, address payable b, uint256 shareBpsA) {
        require(shareBpsA <= 10_000, "invalid share");
        partyA = a;
        partyB = b;
        shareA = shareBpsA;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    function distribute() external {
        uint256 balance = address(this).balance;
        uint256 toA = (balance * shareA) / 10_000;
        uint256 toB = balance - toA;
        (bool okA, ) = partyA.call{value: toA}("");
        (bool okB, ) = partyB.call{value: toB}("");
        require(okA && okB, "transfer failed");
        emit Distributed(toA, toB);
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }
}
