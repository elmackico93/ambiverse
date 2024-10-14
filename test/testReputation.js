const AmbiverseReputation = artifacts.require("AmbiverseReputation");

contract("AmbiverseReputation", (accounts) => {
    let reputationInstance;

    before(async () => {
        reputationInstance = await AmbiverseReputation.deployed();
    });

    it("Should increase reputation in creativity", async () => {
        await reputationInstance.increaseReputation(accounts[0], "creativity", 50);
        let reputation = await reputationInstance.getReputation(accounts[0]);
        assert.equal(reputation.creativity.toNumber(), 50, "Creativity should be 50");
    });

    it("Should increase reputation in technology", async () => {
        await reputationInstance.increaseReputation(accounts[1], "technology", 100);
        let reputation = await reputationInstance.getReputation(accounts[1]);
        assert.equal(reputation.technology.toNumber(), 100, "Technology should be 100");
    });
});
