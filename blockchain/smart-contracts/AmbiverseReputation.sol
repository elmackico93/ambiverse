// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AmbiverseReputation {
    // Struttura per la reputazione dell'utente
    struct Reputation {
        uint256 creativity;
        uint256 love;
        uint256 technology;
        uint256 entrepreneurship;
    }

    mapping(address => Reputation) public userReputation;

    // Eventi per tracciare la reputazione
    event ReputationIncreased(address indexed user, string reputationType, uint256 amount);
    event ReputationDecreased(address indexed user, string reputationType, uint256 amount);

    // Funzione per aumentare la reputazione
    function increaseReputation(address user, string memory reputationType, uint256 amount) public {
        if (keccak256(bytes(reputationType)) == keccak256(bytes("creativity"))) {
            userReputation[user].creativity += amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("love"))) {
            userReputation[user].love += amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("technology"))) {
            userReputation[user].technology += amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("entrepreneurship"))) {
            userReputation[user].entrepreneurship += amount;
        }
        emit ReputationIncreased(user, reputationType, amount);
    }

    // Funzione per ridurre la reputazione
    function decreaseReputation(address user, string memory reputationType, uint256 amount) public {
        if (keccak256(bytes(reputationType)) == keccak256(bytes("creativity"))) {
            require(userReputation[user].creativity >= amount, "Creativity insufficient.");
            userReputation[user].creativity -= amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("love"))) {
            require(userReputation[user].love >= amount, "Love insufficient.");
            userReputation[user].love -= amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("technology"))) {
            require(userReputation[user].technology >= amount, "Technology insufficient.");
            userReputation[user].technology -= amount;
        } else if (keccak256(bytes(reputationType)) == keccak256(bytes("entrepreneurship"))) {
            require(userReputation[user].entrepreneurship >= amount, "Entrepreneurship insufficient.");
            userReputation[user].entrepreneurship -= amount;
        }
        emit ReputationDecreased(user, reputationType, amount);
    }

    // Funzione per ottenere la reputazione di un utente
    function getReputation(address user) public view returns (Reputation memory) {
        return userReputation[user];
    }
}
