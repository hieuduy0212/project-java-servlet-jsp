package com.example.dao;

import com.example.entity.Favorite;

import java.util.List;

public interface FavoriteDAO {
    void addProductToFavorite(int user_id, int product_id);
    List<Favorite> getAllFavoriteOfUser(int user_id);

    void deleteFavoriteById(int user_id, int product_id);
}
