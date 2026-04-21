// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VegaRegistry
/// @notice Label to owner registry.
/// @custom:kind registry
contract VegaRegistry {
    mapping(bytes32 => address) public ownerOf;

    event Registered(bytes32 indexed key, address indexed account);
    event Transferred(bytes32 indexed key, address indexed from, address indexed to);

    function register(string calldata label) external {
        bytes32 key = keccak256(bytes(label));
        require(ownerOf[key] == address(0), "already registered");
        ownerOf[key] = msg.sender;
        emit Registered(key, msg.sender);
    }

    function transfer(string calldata label, address to) external {
        bytes32 key = keccak256(bytes(label));
        require(ownerOf[key] == msg.sender, "not owner");
        require(to != address(0), "zero address");
        ownerOf[key] = to;
        emit Transferred(key, msg.sender, to);
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "VegaRegistry";
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }
}
