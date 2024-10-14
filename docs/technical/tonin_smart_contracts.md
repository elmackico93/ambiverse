
# Tonin Smart Contracts Documentation

## Introduction
The **PolyTonin** smart contract is inspired by the god Poly, who embodies wisdom, technological advancement, and unconditional love for Velly. In the Ambiverse ecosystem, Poly represents the power of technology and entrepreneurial spirit. As such, this smart contract is designed to regulate the distribution of the in-game currency, Tonin, by rewarding technological contributions.

## Smart Contract Overview

The `PolyTonin` smart contract governs the logic of distributing and managing Tonin, a unique cryptocurrency in the Ambiverse metaverse. In this ecosystem, accumulating Tonin does not represent wealth but rather a lower level of wisdom and social contributions. Users can reduce their Tonin balance by making meaningful contributions to the system, especially in the field of technology.

### Key Features
- **Technological Contributions**: The contract decreases the Tonin balance of users who make technological contributions, symbolizing growth in wisdom and alignment with Poly's principles.
- **Owner Privileges**: Only the contract owner can reward users for their contributions. This ensures fairness and control over the Tonin balance.
- **Event Tracking**: Every rewarded contribution is logged through an event to ensure transparency and traceability.

### Functions

- **rewardContribution(address user, string memory contributionType)**: This function allows the contract owner to reward users for their contributions. In particular, it reduces the user's Tonin balance by 10 if the contribution is categorized as "technological". Poly's influence is reflected here, as contributions to the technological infrastructure of Ambiverse directly decrease Tonin, symbolizing increased wisdom.

- **getToninBalance(address user)**: This function allows anyone to view the Tonin balance of a user. It is a public function that provides transparency within the ecosystem.

### How Poly Inspires the Contract

Poly, as a divine figure, represents technological wisdom and the entrepreneurial spirit that guides the development of Ambiverse. The logic of this contract aligns with Poly's philosophy by rewarding those who enhance the technological foundation of the multiverse. The reduction of Tonin for technological contributions signifies the user's growth in understanding, aligning with Poly’s role as the overseer of wisdom and progress.

## Conclusion
The **PolyTonin** smart contract ensures that the Ambiverse remains a dynamic and fair ecosystem where technological contributions are highly valued. By following Poly's guidance, this contract allows users to lower their Tonin balance, which brings them closer to wisdom and higher moral standing in the metaverse.
