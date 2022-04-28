const axios = require('axios').default
const url = "https://avatars.dicebear.com/api/big-smile/avatar.svg"

async function getAvatar(seed) {
    return await axios.get(url, {
        params: {
            radius: 50,
            eyes: seed.eyes,
            skinColor: seed.skinColor,
            hair: seed.hair,
            hairColor: seed.hairColor,
        }
    })
}

export { getAvatar }