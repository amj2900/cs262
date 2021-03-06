import React, { useState } from 'react';
import { StyleSheet, View, TextInput, Button } from 'react-native';

export default function AddTodo({ submitHandler }) {
  [text, setText] = useState('');

const changeHandler = (val) => {
  setText(val);
}

  return (
    <View>
      <TextInput 
      style={styles.input}
        placeholder='new todo...'
        // value={text}
        onChangeText={changeHandler}
      />
      <Button onPress={() => submitHandler(text)} title='add todo' color='coral' />
    </View>
  );
}

const styles = StyleSheet.create({
  input: {
    marginTop: 10,
    marginBottom: 10,
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderBottomWidth: 1,
    borderBottomColor: '#ddd'
  }

})