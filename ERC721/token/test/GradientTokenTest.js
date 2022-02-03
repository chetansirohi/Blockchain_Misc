//import { assertRevert } from "./assertRevert.js";

const GradientToken = artifacts.require("GradientToken");

contract("Gradient Token",accounts =>{
    it("Should make first account an owner",async ()=>{
        let instance = await GradientToken.deployed();
        let owner = await instance.owner();

        assert.equal(owner,accounts[0]);
    });

    describe("mint",()=> {
        it("Creates token with specified outer and inner colours", async ()=>{
            let instance = await GradientToken.deployed();
            let owner = await instance.owner();

            let token = await instance.mint("#ff00dd","#ddddff");
            

            let tokens = await instance.tokensOf(owner);
            let gradients = await instance.getGradient(tokens[0]);

            assert.equal(gradients,["#ff00dd","#ddddff"]);
        });

        it("test", ()=>{
            
        });

    });


})
