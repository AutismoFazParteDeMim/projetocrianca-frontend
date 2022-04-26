import React, { useEffect, useState, useContext } from "react"
import { Button, TouchableOpacity, View } from "react-native"
const axios = require('axios').default
import { SvgXml } from "react-native-svg"

import { firestore } from "../../config/firebase"
import { updateDoc, doc } from "firebase/firestore"

import { useDispatch, useSelector } from "react-redux"
import { firstTime } from "../../redux/modules/settings/actions"

import { Container } from "./styles"

export default function Avatar({ navigation }) {
    const { user } = useSelector((state) => state.user)
    const dispatch = useDispatch()
    const [avatar, setAvatar] = useState()
    const [seed, setSeed] = useState({
        backgroundColor: "#ffffff",
        sex: "male",
        eyes: "open",
        skinColor: "tone1",
        hair: "long",
        hairColor: "black",
        clothingColor: "blue"
    })

    function getAvatar() {
        axios.get(`https://avatars.dicebear.com/api/personas/male/avatar.svg`, {
            params: {
                radius: 50,
                eyes: seed.eyes,
                skinColor: seed.skinColor,
                clothingColor: seed.clothingColor,
                hair: seed.hair,
                hairColor: seed.hairColor,
            }
        })
            .then(function (response) {
                setAvatar(response.data)
            })
            .catch(function (error) {
                console.log(error);
            })
            .then(function () {
                // always executed
            });
    }

    async function setChildPic() {
        await updateDoc(doc(firestore, "users", user.uid), {
            childPic: avatar
        }).then(() => {
            dispatch(firstTime(false))
            navigation.goBack()
        })
    }

    useEffect(() => {
        getAvatar()
    }, [seed])

    return (
        <Container>
            <TouchableOpacity style={{ borderRadius: 50 }}>
                {avatar && <SvgXml width="150" height="150" xml={avatar} />}
            </TouchableOpacity>
            <View>
                <Button title="Cabelo 1" onPress={() => setSeed({ ...seed, hair: "long" })} />
                <Button title="Cabelo 2" onPress={() => setSeed({ ...seed, hair: "curly" })} />
                <Button title="Cabelo 3" onPress={() => setSeed({ ...seed, hair: "bald" })} />
            </View>
            <Button title="Obter Avatar" onPress={() => setChildPic()} />
        </Container>
    )
}