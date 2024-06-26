SELECT ITEM_INFO.ITEM_ID
     , ITEM_INFO.ITEM_NAME
     , ITEM_INFO.RARITY
  FROM ITEM_INFO AS ITEM_INFO
  JOIN (SELECT ITEM_TREE.ITEM_ID AS ITEM_ID
          FROM ITEM_INFO AS ITEM_INFO
          JOIN ITEM_TREE AS ITEM_TREE
            ON ITEM_INFO.ITEM_ID = ITEM_TREE.PARENT_ITEM_ID
         WHERE ITEM_INFO.RARITY = 'RARE') AS UPGRADE
    ON ITEM_INFO.ITEM_ID = UPGRADE.ITEM_ID
 ORDER BY ITEM_INFO.ITEM_ID DESC;