export default function shuffleArray(array) {

    let indice = array.length;

    while (indice) {
        const indiceAleatorio = Math.floor(Math.random() * indice--);
        [array[indice], array[indiceAleatorio]] = [array[indiceAleatorio], array[indice]];
    }

    return array;
}