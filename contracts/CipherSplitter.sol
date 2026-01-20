// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title CipherSplitter
/// @notice Two-party payment splitter.
/// @custom:kind splitter
contract CipherSplitter {
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

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Returns the larger of two values.
    function maxOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns the smaller of two values.
    function minOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a < b ? a : b;
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }
}
