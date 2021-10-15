import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Button from './src/components/Button';

import Header from './src/components/Header';

export default function App() {
  return (
    <View style={styles.container}>
      <Header title="Faça Login" />
      <StatusBar
        animated={true}
        backgroundColor="#fff"
        translucent={false}
        hidden={false} />

        <Button  icon="log-in-outline" text="Login" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});