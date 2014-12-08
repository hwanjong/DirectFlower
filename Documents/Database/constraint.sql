
alter table like_info add constraint like_info_user_list foreign key (user_id) references user_list(user_id) ON DELETE CASCADE;
alter table like_info add constraint like_info_shop_list foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table order_info add constraint order_info_user_list foreign key (user_id) references user_list(user_id) ON DELETE CASCADE;
alter table order_info add constraint order_info_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table sale_list add constraint sale_list_order_info foreign key (order_id) references order_info(order_id) ON DELETE CASCADE;
alter table sale_list add constraint sale_list_product_list foreign key (product_id) references product_list(product_id) ON DELETE CASCADE;
alter table user_list add constraint user_list_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table post add constraint post_user_list foreign key (user_id) references user_list(user_id) ON DELETE CASCADE;
alter table post add constraint post_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;
alter table auction_list add constraint auction_list_order_info foreign key (order_id) references order_info(order_id) ON DELETE CASCADE;
alter table response_shop add constraint response_shop_order_info foreign key (order_id) references order_info(order_id) ON DELETE CASCADE;
alter table response_shop add constraint response_shop_shop foreign key (shop_num) references shop(shop_num) ON DELETE CASCADE;

create sequence id
start with 1
increment by 1
maxvalue 100000;