// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title DragonRegistry
/// @notice Label to owner registry.
/// @custom:kind registry
contract DragonRegistry {
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

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "DragonRegistry";
    }
}
