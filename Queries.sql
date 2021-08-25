--User 
Statements/Queries
Creation of User
INSERT INTO users(id,first_name, last_name,dob, address, email) VALUES ("p_1", "John", "Smith", "01/01/1999", "805 St Cloud Road, Bel Air, Los Angeles, CA.", "john_smith@test.com")
-- Updating of User information
UPDATE Users SET last_name='Brown' WHERE id='p_1'
-- Delete User (!) Note: ```ON DELETE CASCADE ON UPDATE CASCADE``` have to be present under foreign key in dependent tables
DELETE FROM Users WHERE id='p_1'
-- Get all the users in the database
SELECT * FROM users
-- Get all of the users that were created within the last day
SELECT * FROM Users where created_at >= NOW() - INTERVAL 1 DAY
-- Get all of the users that have the last name (x)
SELECT * FROM users WHERE last_name='smith'
-- Get all of the users that have liked page (x)
SELECT Likes.user_id as likes, Likes.target_id as page_number FROM Likes JOIN Pages on Likes.target_id=Pages.page_id where Pages.page_id='130'
-- Get all of the users that are a part of group (x)
SELECT * FROM users JOIN Groups on users.id=Groups.user_id WHERE groups.group_name='bookclub'
-- Get all of user (x)’s friends
SELECT Users.id, Friends.user_2_id as 'Friends with' FROM Users JOIN Friends on Users.id=Friends.user_1_id WHERE Users.last_name='holmes'
-- Also get the count of this
SELECT Users.id, COUNT(*) as 'Number of friends' FROM Users JOIN Friends on Users.id=Friends.user_1_id WHERE Users.last_name='holmes' GROUP BY Users.id
-- Get all of the content that user (x) is tagged in
SELECT * FROM users JOIN Tags on Users.id=Tags.user2_id JOIN Posts on tags.target_id=Posts.post_id WHERE Users.last_name='holmes'
-- Get the total number of likes user(x) has gotten on a post
SELECT Likes.target_id as post_id,count(*) FROM Likes JOIN Posts ON Likes.target_id=Posts.post_id WHERE Posts.post_id='2'
-- Login
-- Creation of login information
INSERT INTO Login VALUES ('password6','john_smith@test.com')
-- Update password
UPDATE Login SET pass='password111111' WHERE email='john_smith@test.com'
-- Friends
-- Befriend 
INSERT INTO Friends (user_1_id, user_2_id) VALUES ('p_3','p_1')
-- Unfriend
DELETE FROM Friends WHERE user_1_id='p_3' and user_2_id='p_1'
-- Given user x and user y get all of the mutual friends of the two
SELECT person_1.user_1_id as person_one,person_2.user_1_id as person_two, person_2.user_2_id as common_friend  FROM (SELECT * FROM Friends where user_1_id='p_1') as person_1 JOIN (SELECT * FROM Friends where user_1_id='p_5') as person_2 ON person_1.user_2_id=person_2.user_2_id
-- Posts
-- Creation of a post
INSERT INTO Posts VALUES ('p_6', '135',CURRRENT_TIMESTAMP, 'Project', 'Almost done!')
-- Updating of a post
 Update Posts set topic = ‘Marine Animals’ where subtopic = ‘Mammals’;
-- Delete a post (will delete related tags)
Delete from Posts where post_id = '135'
-- select * from Posts where user_id = 'p_1';
-- Get all of the posts made between a time frame x and y
select * from Posts where time_stamp between ' 2020-01-01' and '2020-12-16';

-- Comments 

-- Create Comment
INSERT INTO Comments Values("co_6","p_3","345","groups",'Thank you');
-- Update Comment
UPDATE Comments SET comment_content = "Yes, I do" WHERE comment_content = "Thank you"; 
-- Delete Comment
DELETE FROM Comments WHERE comment_id = 'co_6';
-- Get all of the comments of a given post
select * from comments where target_id = '1';
-- Get all of the comments in a given group
select * from comments where target_id = '345';
-- Get all of the comments on a given page
select * from comments where target_id = '131';
-- Get all the comments of person x on a given post
select * from comments where target_type = 'post' and user_id ='p_1';
-- Get all the comments of person y on a given group
select * from comments where target_type = 'group' and user_id ='p_2';
-- Get all the comments of person z on a given page
select * from comments where target_type = 'page' and user_id ='p_3';

-- Tags
-- Tag a user
INSERT INTO Tags Values ( "p_1", "p_2", 12345679, "Rashaan keeps winning","2020-12-15 16:14:34", 1); 
-- Delete a tag
DELETE FROM Tags WHERE tag_id = 12345679;
-- Get all the tags that person y has tagged person x in
select * from tags where user2_id = 'p_1' and user1_id = 'p_2';
-- Get a list of all the tags person y has been tagged in sorted from most recent to oldest
select * from tags where user2_id = 'p_2' order by time_stamp desc ;
-- Get the friend (user x) that user y has tagged x in the most
SELECT user1_id AS tagger, user2_id as being_tagged, count(user1_id) as tag_count FROM Tags WHERE user1_id='p_2' GROUP BY user2_id

-- Likes
Like 
INSERT INTO Likes VALUES ('p_1','co_1','comment',CURRENT_TIMESTAMP)

-- Unlike 
DELETE FROM Likes 
WHERE user_id = 'p_1'
AND target_id = 'co_1'
AND target_type = 'comment'

-- Get all of the likes that were made by a certain user (x)
SELECT * FROM Likes WHERE user_id = 'p_1'
-- Get all of the likes that made between a time frame x and y by a user (j)
 SELECT * FROM 	Likes 
WHERE user_id ='p_3'
AND time_stamp BETWEEN
'2020-12-16 11:57:23' AND '2020-12-16 12:06:11';

-- Get all the likes that a certain post, page, or comment has
SELECT * FROM Likes	
WHERE target_type = 'comment'
AND target_id = '1'

-- Page
-- Create Page
INSERT INTO Pages VALUES ("p_1","136","2020-12-15 09:30:30","JavaScript","Functions"),
-- Update Page 
UPDATE Pages  SET subtopic='Queries' WHERE subtopic = 'Types of data';

-- Delete Page
DELETE FROM Pages WHERE page_id = '136';
-- Get all the names of the users that have like a certain page
SELECT user_id, page_id FROM Likes NATURAL join Pages where page_id = '130'; 

-- Groups
-- Create Group
INSERT INTO Groups  VALUES ("p_1","1112","Party",CURRENT_TIMESTAMP);
-- Edit Group 
UPDATE Groups  SET group_name = 'The Best BookCLub' WHERE group_name = 'BookClub';
-- Delete Group
DELETE FROM Groups WHERE group_id = '123';
-- Add a user to a group
INSERT INTO groupMembers VALUES ('123', 'p_4',CURRENT_TIMESTAMP);
-- Delete a user from a group
DELETE FROM groupMembers WHERE member_id = 'p_4' and group_id = ‘123’;

-- Transaction Information
-- Create Transaction
INSERT INTO Money_Transactions VALUES('p_1', 'p_2', 'cc_1', CURRENT_TIMESTAMP);


-- Get all of the money transactions involving user y and user x
SELECT * FROM Money_Transactions inner join Users on Users.id = Money_Transactions.user_1_id
where user_1_id = 'p_1' and user_2_id = 'p_2';

-- Get all of the money transactions involving user x
SELECT * FROM Money_Transactions inner join Users on Users.id = Money_Transactions.user_1_id
where user_1_id = 'p_5' or user_2_id = 'p_5';

-- Get all of the money transactions involving user x within a given time frame(t1,t2)
SELECT * FROM Money_Transactions WHERE Transaction_time BETWEEN '2020-01-01 08:00:00' AND '2020-12-15 17:00:00';

-- Credit Card Information
-- Create Card
INSERT INTO CC_info VALUES ("cc_6", "p_1", "Amex", "John Smith", "5555555555555555", "2025") ;
-- Update Card
UPDATE CC_info  SET cc_id='cc_7' WHERE cc_id = 'cc_6' ;
-- Delete Card
DELETE FROM CC_info WHERE cc_id = 'cc_7';

-- Get a list of all the credit cards associated with a user
SELECT * FROM CC_Info inner join Users on Users.id = CC_Info.user_id
where Users.id = 'p_1';


-- Delete all of the credit cards that have expired
DELETE FROM CC_Info WHERE cc_expiry <= '2020';

-- Awards
-- Create award
INSERT INTO Awards VALUES ('6','p_1','p_2',' Best Friend');

-- Get a list of all the awards that user x has been given
SELECT * from Awards where target_user = 'p_1';

-- Get a list of all the awards that user x has given away
SELECT * from Awards where user_id = 'p_1';

-- Extra Credit Queries: 
                                        
-- GENERAL

--  Modify columns’ size or type
ALTER TABLE Tags modify tag_id int(20);

ALTER TABLE Tags modify tag_id varchar(20);

-- POST

-- Number of likes per Post per User
SELECT count(Posts.user_id) as numberOfLikes, post_id, Posts.user_id from Posts inner join Likes on Posts.post_id = Likes.target_id
where target_type = 'post'
group by post_id
;

-- User with the highest number of likes in a post

SELECT PostLikes.numberOfLikes, PostLikes.post_id, PostLikes.user_id, PostLikes.post_content FROM (
    SELECT count(Posts.user_id) as numberOfLikes, post_id, Posts.user_id, Posts.post_content from Posts inner join Likes
    on Posts.post_id = Likes.target_id
    where target_type = 'post'
    group by post_id) AS PostLikes
    WHERE PostLikes.numberOfLikes = (SELECT MAX(PostLikes.numberOfLikes)
                                     FROM (SELECT count(Posts.user_id) as numberOfLikes, post_id,
                                           Posts.user_id from Posts inner join Likes
                                           on Posts.post_id = Likes.target_id
                                           where target_type = 'post'
                                           group by post_id) AS PostLikes);
                                         
-- Or 

select count(Posts.user_id) as NumberOfLikes, target_id, Posts.user_id, Posts.post_content from Likes inner join Posts on Likes.target_id = Posts.post_id where target_type = 'post'
group by target_id 
ORDER BY NumberOfLikes desc LIMIT 1;




-- The most liked post of user(X)
select count(Posts.user_id) as NumberOfLikes, target_id, Posts.user_id, Posts.post_content from Likes inner join Posts on Likes.target_id = Posts.post_id where target_type = 'post' and Posts.user_id = 'p_2'
group by target_id 
order by NumberOfLikes desc limit 1
;


-- GROUPS

-- Awards given and received  ONLY in (X) group

-- Since there are other users from other groups giving AWARDS to members of our (x) group, we need to filter the awards given ONLY by members of (x) group.

CREATE VIEW GiverAward AS
SELECT Awards.user_id AS GiveAward, Awards.target_user AS ReceiveAward, Awards.award_name, groupMembers.group_id AS GroupId, Groups.group_name AS  groupsOfGiver
FROM Awards inner join groupMembers on Awards.user_id = groupMembers.member_id inner join Groups on groupMembers.group_id = Groups.group_id;

-- Since there are other users from other groups receiving AWARDS from members of our (x) group, we need to filter the awards received ONLY by members of (x) group.

CREATE VIEW ReceiverAward AS
SELECT Awards.target_user AS ReceiveAward, Awards.award_name,
groupMembers.group_id AS GroupId, Groups.group_name AS groupsOfReceiver
from Awards inner join groupMembers on Awards.target_user = groupMembers.member_id inner join Groups on groupMembers.group_id = Groups.group_id
;

-- Now, we will join our  tables (VIEWS), in order to see if both, the user that gave the AWARD and the user that received the AWARD belong to the same group (x). The ‘Distinct’ clause is used to avoid the name_award repetition each time a new group is listed for the receiver or giver.

SELECT Distinct GiverAward.GiveAward, GiverAward.ReceiveAward, GiverAward.GroupId, GiverAward.award_name, GiverAward.groupsOfGiver, ReceiverAward.groupsofReceiver
from GiverAward inner join ReceiverAward on GiverAward.ReceiveAward = ReceiverAward.ReceiveAward
where GiverAward.groupsOfGiver = 'Family' and ReceiverAward.groupsOfReceiver ='Family'
;

-- User with the highest number of awards in (x) group:

SELECT TableAwards.ReceiveAward, TableAwards.awardscount from ( 
    select receiveraward.ReceiveAward, count(DISTINCT giveraward.award_name) as awardscount
    from GiverAward inner join receiveraward on giveraward.ReceiveAward = receiveraward.ReceiveAward 
    where GiverAward.groupsOfGiver = 'Family' and ReceiverAward.groupsOfReceiver ='Family'
    group by receiveraward.ReceiveAward) as TableAwards 
    where TableAwards.awardscount =(select max(TableAwards.awardscount) 
                                    from (
                                        select receiveraward.ReceiveAward, count(DISTINCT giveraward.award_name) as awardscount
                                        from GiverAward inner join receiveraward on giveraward.ReceiveAward = receiveraward.ReceiveAward 
                                        where GiverAward.groupsOfGiver = 'Family' and ReceiverAward.groupsOfReceiver ='Family'
                                        group by receiveraward.ReceiveAward) as TableAwards);



-- Or 

SELECT count(DISTINCT giveraward.award_name) as NumberOfAwards, receiveraward.ReceiveAward from GiverAward  inner join receiveraward on giveraward.ReceiveAward = receiveraward.ReceiveAward 
where GiverAward.groupsOfGiver = 'Family' and ReceiverAward.groupsOfReceiver ='Family'
group by receiveraward.ReceiveAward
Order by NumberOfAwards desc limit 1;