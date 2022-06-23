import styled from "styled-components/native"

export const Container = styled.View`
    width: 100%;
    flex-direction: row;
    align-items: center;
    justify-content: flex-start;
`

export const ChatContainer = styled.View`
    width: 60%;
    min-height: 60px;
    padding: ${({ theme }) => theme.metrics.padding}px;
    border-radius: ${({ theme }) => theme.metrics.padding}px;
    background-color: ${({ theme }) => theme.colors.background};
`