const axios = require('axios').default
const url = "https://api.github.com/repos/AutismoFazParteDeMim/ProjetoCrianca/contributors"

async function getGitData() {
    return await axios.get(url, {params : {}})
}

export { getGitData }