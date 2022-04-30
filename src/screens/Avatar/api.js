const axios = require('axios').default
const url = "https://avatars.dicebear.com/api/big-smile/:seed.svg"

async function getAvatar(seed) {
    return await axios.get(url, {
        params: {
            accessories: seed.accessories,
            accessoriesProbability: seed.accessoriesProbability,
            scale: 80,
            radius: 50,
            eyes: seed.eyes,
            mouth: seed.mouth,
            skinColor: seed.skinColor,
            hair: seed.hair,
            hairColor: seed.hairColor,
        }
    })
}

export { getAvatar }