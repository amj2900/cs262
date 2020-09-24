import React, { useState } from 'react';
import { StyleSheet, View, Text, FlatList, Alert, TouchableWithoutFeedback, Keyboard } from 'react-native';
import Header from './components/header';
import TodoItem from './components/todoItem';
import AddTodo from './components/addTodo';

export default function App() {
  const [todos, setTodos] = useState([
    {text: 'buy coffee', key: '1'}

  ]);

  const submitHandler = (text) => {
    
    if(text.length > 3){

      setTodos((prevTodos) => {
        return[
          {text: text, key:Math.random().toString() },
          ...prevTodos
        ];
      });

    } else {
        Alert.alert('OOPS!', 'Todos must be over 3 chars long',[
        {text: 'Understood', onPress: () => console.log('alert closed')}
      ]);
    }
  }

    
  const pressHandler = (key) => {
    setTodos((prevTodos) => {
      return prevTodos.filter(todo => todo.key !=key);
    });
  }


  return (
    <TouchableWithoutFeedback>
      <View style={styles.container}>
        <Header />
        <View style={styles.content}>
          <AddTodo submitHandler={submitHandler} />
          <View style={styles.list}>
            <FlatList 
              data={todos}
              renderItem={({ item }) => (
                <TodoItem item={item} pressHandler={pressHandler}/>
              )}
            />
          </View>
        </View>
      </View>  
    </TouchableWithoutFeedback>
  );
}



  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#fff',
    },

  });

