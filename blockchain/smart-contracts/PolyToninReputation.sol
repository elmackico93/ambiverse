// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AmbiverseReputation {
    // Struttura per le reputazioni
    struct Reputation {
        uint256 creativity;
        uint256 love;
        uint256 technology;
        uint256 entrepreneurship;
    }
    
    // Mapping per tenere traccia delle reputazioni degli utenti
    mapping(address => Reputation) public userReputation;

    // Evento per tracciare la crescita della reputazione
    event ReputationIncreased(address indexed user, string reputationType, uint256 amount);

    // Funzione per aumentare la reputazione in base all'azione svolta
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

    // Funzione per controllare la reputazione di un utente
    function getReputation(address user) public view returns (Reputation memory) {
        return userReputation[user];
    }
}
