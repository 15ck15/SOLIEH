// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title QuantumSplitter
/// @notice Two-party payment splitter.
/// @custom:kind splitter
contract QuantumSplitter {
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

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "QuantumSplitter";
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }
}
