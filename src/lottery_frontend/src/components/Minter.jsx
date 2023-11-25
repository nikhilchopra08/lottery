import React, { useState } from 'react';
import { lottery_backend } from '../../../declarations/lottery_backend/index';

const Minter = () => {
  const [diceResult, setDiceResult] = useState(null);
  const [nftReward, setNftReward] = useState(false);
  const [nftPrincipal, setNFTPrincipal] = useState('');

  const rollDice = () => {
    const result = Math.floor(Math.random() * 6) + 1;
    setDiceResult(result);

    if (result === 4 && !nftReward) {
      mintNFT();
    }
  };

  async function mintNFT() {

      const name = 'CryptoZombie';
      const image= "images/NFT4.png";

      const imageBuffer = await response.arrayBuffer();
      const imageByteData = [...new Uint8Array(imageBuffer)];

      const newNFTID = await lottery_backend.mint(imageByteData, name);
      setNftReward(true);
      setNFTPrincipal(newNFTID.toText());
   
  }

  const renderNftReward = () => {
    return nftReward ? <p>Congratulations! You've won an NFT!</p> : null;
  };

  return (
    <div>
      <h1>Lottery Result: {diceResult}</h1>
      <button onClick={rollDice} disabled={nftReward}>
        Roll Dice
      </button>
      {renderNftReward()}
    </div>
  );
};

export default Minter;
