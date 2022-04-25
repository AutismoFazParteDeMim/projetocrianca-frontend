import React, { useState } from "react"
import { Container,Image,Buttom } from "./styles"
import Text from "../../../components/Text"


export default function EscolhaSexo(){
    const [Sex,setSex] = useState()
    return(
        <Container>
           <Buttom onPass={() => setSex("male")}>
                <Image source={require("../assets/AvatarM.png")}/>  
                <Text>Masculino</Text>  
           </Buttom>

           <Buttom onPass={() => setSex("female")}>
                <Image source={require("../assets/AvatarF.png")}/>  
                <Text>Feminino</Text>
           </Buttom>
        </Container>

    )
   
}

