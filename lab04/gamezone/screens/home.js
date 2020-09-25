import React, { useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';

export default function Home({ navigation }) {
    const [reviews, setReviews] = useState([
        {title: 'Duncan is worse', rating: 5, body: 'lorem ipsum', key: '1'},
        {title: 'Duncan is Dutch', rating: 5, body: 'good time',key: '2'},
        {title: 'Duncan is trash',rating: 10, body: "I cried, I hate him so much.",key: '3'}
    ]);

    return (
        <View style={globalStyles.container}>
            <FlatList data={reviews} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('reviewDetails', item)}>
                    <Text style={globalStyles.titleText}>{ item.title }</Text>
                </TouchableOpacity>
            )} />
        </View>
    );
}

