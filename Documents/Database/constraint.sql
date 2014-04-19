
alter table like_info add constraint like_info_user_list foreign key (user_id) references user_list(user_id) ON DELETE CASCADE;
alter table like_info add constraint like_info_shop_list foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table order_info add constraint order_info_user_list foreign key (user_id) references user_list(user_id) ON DELETE CASCADE;
alter table post add constraint post_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table sale_list add constraint sale_list_order_info foreign key (order_id) references order_info(order_id) ON DELETE CASCADE;
alter table sale_list add constraint sale_list_product_list foreign key (product_id) references product_list(product_id) ON DELETE CASCADE;
alter table shop_product add constraint shop_product_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table shop_product add constraint shop_product_product_list foreign key (product_id) references product_list(product_id) ON DELETE CASCADE;
alter table user_list add constraint user_list_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;