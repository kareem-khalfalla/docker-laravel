### Services

1. nginx
2. php
3. composer
4. artisan
5. node
6. mysql



> In the php container run this commands in case you face storage or logs access permission denied.

`chmod -R gu+w storage`

`chmod -R guo+w storage`

`php artisan cache:clear`




# Artisan Service
<hr style="border:2px solid gray"> </hr>

> In-order to interact with the **artisan** container:  
> `docker-compose run --rm artisan cache:clear`.





# Composer Service
<hr style="border:2px solid gray"> </hr>

> In-order to interact with the **composer** container:  
> `docker-compose run --rm composer install`





# Node Service
<hr style="border:2px solid gray"> </hr>

> In-order to interact with the **node** container:  
> `docker-compose run --rm node npm install`