/* Урок 8. Сложные запросы*/

-- 1.Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).


SELECT users.id, users.first_name, users.last_name, COUNT(messages.from_user_id) AS messages_amount
  FROM messages
    JOIN users
      ON messages.from_user_id = users.id
    JOIN friendship
      ON friendship.friend_id = messages.from_user_id
    JOIN friendship_statuses
      ON friendship.status_id = friendship_statuses.id
        WHERE messages.to_user_id = 15 AND friendship_statuses.id = 1
        GROUP BY users.id
        ORDER BY messages_amount DESC
        LIMIT 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.

SELECT users.id, users.first_name, users.last_name, profiles.birthday, COUNT(likes.target_type_id) AS likes_per_user
  FROM users
    JOIN likes
      ON users.id = likes.user_id
    JOIN profiles
      ON profiles.user_id = users.id
    LEFT JOIN target_types
      ON likes.user_id = target_types.id
        WHERE likes.target_type_id IN (2, 3, 4, 5)
        GROUP BY users.id
        ORDER BY birthday DESC 
        LIMIT 10;
        
       SELECT * FROM target_types;

-- 3.Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT profiles.sex AS sex, COUNT(likes.created_at) AS likes_amount
  FROM profiles
    JOIN users
      ON profiles.user_id = users.id
    JOIN likes
      ON users.id = likes.user_id
      GROUP BY profiles.sex      
      ORDER BY likes_amount DESC
        LIMIT 1;