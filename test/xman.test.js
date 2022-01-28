var xMan = artifacts.require("./XMan.sol");

contract('XMan', (accounts) => {

    let contractInstance;

    const INITIAL_SUPPLY = 1000000;

    beforeEach(async () => {
        contractInstance = await xMan.deployed();
    });

    it('Should put 1000000 Token in the first account', async() =>{
        let balance = await contractInstance.balanceOf.call(accounts[0])

        assert.equal(balance.valueOf(), INITIAL_SUPPLY, 'The initial supply seems incorrect ${INITIAL_SUPPLY}');
    });

    it('Should send 10 TomTokens correctly', async () => {
        var accOne = accounts[0];
        var accTwo = accounts[1];

        var accOneStarBal = await contractInstance.balanceOf.call(accOne);
        var accTwoStarBal = await contractInstance.balanceOf.call(accTwo);

        var amount = 10;
        await contractInstance.transfer(accTwo, amount, { from: accOne})

        var accOneEndBal = await contractInstance.balanceOf.call(accOne);
        var accTwoEndBal = await contractInstance.balanceOf.call(accTwo);

        var balOne = accOneEndBal.toNumber();
        var balTwo = accTwoEndBal.toNumber();
        var checkOne = accOneStarBal - amount;
        var checkTwo = accTwoStarBal + amount;

        assert.equal(balOne, checkOne, "Amount wasn't succesfully taken from sender");
        assert.equal(balTwo, checkTwo, "Ammount wasn't succesfully sent to the receiver");
    });
})