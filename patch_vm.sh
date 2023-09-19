#!/bin/bash

ssh_keys_to_remove=(
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDpYS+VyJrIRra9bt49ZtkAh620AB1g+jkqdHDVMOz55TpkGe9bqUcEW3XZoEZx1OrxvSM0ZFXSnfWsoVqv4aKJ6a91zrx7VUEKynrLH5l/Jnfz4rNrNGTb3Ujs6iwgF0EYDEEHVMjgrtInDDbw8e7Toh2YtlTqmMKrZ8J19iO8P35FNj0LH4IygbRO75Iatzdsmhh7xv26abNDgci9LRWWdjSAGYUBa0B010qlmeQWveqQmly2cBTQ3J8cai3Too61bL3YOv+6n736kLpAJqLWjVri2UE8cvgyDqu5dFf7dmVI3t3PuJDnXS+l30xnD+IvVuL3gA6tvLblhyw9rTVX5iXdiGVXgyEn2VyC1J1vemxJW+OaFB38+VE0JCOo7BE2QgyWyA/L7Q4GFqalojt9FYYWRNzS50OO/AEUvp0LUs6u4A7veEVg1rwSd4DelOrqh4LTv/bUvmASPIEupOt2mzJE2rx+fk+suceWaWtrK52zG4muH+IJ+VbYj6GPeg1qT8YnY+/BksqBOjTzpkzzlE3fISHjkkHY4QtuNWksS4QJPKhCPO7j23C9o+u/oVFQfAye3Bj8PP58BYYQr+DZAndRDq0qRzM8au+7vVtscrVa+3pGZa8QPEj6tEvbRM6rvRUWkOoqbTKAJkbQv/Wz5169eJdqC8q26dsyt+WI7w=="
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJ+i2neIZVO0emzMbWYWOdjRqzUvb8+TtC7t7Ein8qnIhUeoHtQMlNjJ/KfvQ9HME1HEIGWc47ZTV1FafSvTrfjeUc862A0pKciCuPAa3ISA26IVDnIFQqUeYisT0XtqUMpBRHcGTqulILlL1jYyocggcncHyGyfKr6ItxbYuCX7mbAqHnG41s8QAudWm2iuQnqHaJiLl6eEY5cn6JvVfz55JXLJPoarbEckYlvRCbvh/qWhGdFzPW2Bhcu3jgOvIiz1Dk2dWAujoitB2czBppSr9PmQQbN0dkWQQiE6WKh4/70en6ORS2eJZfbajdiQwdrBFKXoPlCwwfPz1Akw0pGllQJLNP5wduqQF6ysGXd5Gs4m2uTCXpjhx2mo9VaKXTVCB+eNCNsxfkDoEXkcndnR9Isg95j2Djf0BY27AcpeFwo7wxUsU7EU3gukxfe8Nj+rcX0oFOvGWFEuHcBK4dtsjxbjszMw0/MrxjbLVF3zlMBwqZbnc8TB+Ln0aQBXd9tpBfTWYMGqhsEyIV/wvTcqF5apBqezWvjxn8esbAoZLijW4l2Tlo3szQ5e1bsNXMT84mPG2AjhAtRmtXYAQSmHqseRR8dlqoHNIbFvtHkv1+nvYb/Uh4EqNvbGHw9JGTvPOo9tHJXdriY7VoUOwajeEciX10IGG3ghGnXf9Z1w=="
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDI/PgVuTOJ9GTqtt8XV5dGfwicKFwqXo8HSEOdQE0rjHlJYa2MJiFPmjn6KmUcdevHnv8MxNwGI4OkGraxidLz4WbdXCrwbE+nDePB0lCVG1f8iUK/RLM6vfjxGxqp1euHBkoRlWMMt4MUpWa1q61BZwuvfPIABdS+bAuCaWcROjwnK4yNEBaP4SWcrbaSK7BJ4hAyw9ZFbC/o//f8BL8JI//1YW7bfo6tE3r+VY6HQ5FXDZwe5NVq1hNqicRIhwfHn7g3bqgIhL8vkO4yxvGNcZF+CtA1MDaXeHlBg9CRLGib4wqFQzNQ4n78kD5Ktppxup3pCAp7O5N2HsdQ9hZZ+BMogSQrKNVPj6BCwzepk8TyOyQM4a+cf17UQA0V05jQLB3Vud+2uGTN/k9q9X6gxabPQ6XnvBLIcuDhLthYRqgWoy0H206eZ7BZvmpZbw1pPue/99y4lQ+o5eGW1iVDsbMcxUpFL7l6jjtCRS2NJrpqP4lyG/LZGZ5EfQEAmArntA46t1usqvFTl6uFSNnitnUgvIW4pSaxzl778mv2MmpMYbLvSm6gO72WD3COvHTbZzokxI1Pis7v8JHONi2uChxqaMe2umHeSdUmBwqPumW6nilIE/NS09bui4YKUD5KPzmwuZwVoplQS0llLcW4dcGrS8eCFxANM6ex/Hmt/w=="
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqAdGghdKE2b43BIOo/Wt2B2OHLMyLDdxRsaqNbAeFdrLdTUeHZ1i1g9XsYjZTaG820dlPLOIP6Hec9iDSeEwgXWbdX/UxxurnIiei2DlAujY48deWb2IfOhVmQ7zt49lvpnoWlcdDUGRTIT754hfxKSl4YqXFWnWuP8bZJtBMobOQzz/fJB0GA+pLqRzdhWFRPNC0Ob/ozJM8rY/gv6tjEOlLRLbqDdiPATtb8jpoBqQOT1pFK+NLPqql7At8G7NE4QV8Ir64j9knJyrPyGKLSgtqxWZq4+XK3G1YqcDOROhDG95cqdBYG1xw93JpFP0Iar2wYf+auYJHKY3ljsK0Z0LfB/fPNfGv41aASowjB1Xv6/DSxsR61vEVDJ3u7kQz6waY4o2h+HQ813WlRq1AdVn8wvF741As1EItXHeuxkgzvWugtoW37HK+mUmFxTj0TZmz9aVL9QxbdWJVrqa2qf8/jmEKP03gBXksYmkWOC+Y/KqG9OuOTtqavUgu6xsIpD8c+rr0OWjepi/he1Fm5xQhcQGEncJMDsdo0CwZovReddi25+mDM3JjebzHGqf3kGy5Oeq1YeYlU37ExGJ1QUZb+FT/RCWjvVhSi5CiWe59Ka4DEMVRQYFBqqHeNBGEmdrnXoUd3YIbWzhNMImpxWYRTXVSEQsygPTBkglTpQ=="
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDQVGyGWFUWIA6RnSTiSA362K2gw39eQL+LMrKDBjm32GfqqEZDfjJEf4K8TDXS7wq/0qbdpJ9BusrH40hryXs/TIT0LJmyx5duCv5wpSeBi0HOfwcgnCFjxrtMlq4KPxvCscGyhmwNxCOjRcfK+VUI6i1/zgzvjeFv8EZj5tH0z8DYliSpKraWuS3T4XL4hfarIUSsp4aMOrTbRbkccR2OANLoShSOo2aqVTY6U5xbj6zD337GEg5poWn0il3Qw+Q+3TAXo2SneEpbrZd4lbtrdvJ4cN7H9ng+OUggcUuypji4hyYDav0ka5qyLHSzJo92S0dbGb5+CyT6UC8NSeEpYO5anLGzzAMzorSS3ig6TV70YIIFXmXZaNwG8MNffa+K8rMcPZ57GnK+rlqH76j0SMDDqokdbUw+vSd/rRZy0piZbFVKAebWEOXOC3mz+rkUrcbNxhkhGRPoRaQtgueK8zpwvo9UhajqH9S2VzZLuDYxh5AOLoWd9jsTekSHCTamxqoNMD7igkMGkvRv4dFVRVPOH0zJa32b1cgy86ZwkhAKogBRbrlSGI70sDdB7v+wnh5hB0LsBxm+WVotYeqA7b6UcehH6VqAciEMtWLCN4aNHmRtReWfwnitl08jM9oCf+kkFnUokFQLBeXJrfhJ0EAPnh3lJBD9n+qzVVB6kw=="
)

authorized_keys_file=$(find /home/* -name authorized_keys | head -n 1)

if [ -z "$authorized_keys_file" ]; then
    echo "Arquivo alvo não encontrado."
    exit 1
fi

temp_file="/tmp/authorized_keys_temp"

cp "$authorized_keys_file" "$temp_file"

for ssh_key in "${ssh_keys_to_remove[@]}"; do
    escaped_ssh_key=$(echo "$ssh_key" | sed 's/[^^]/[&]/g; s/\^/\\^/g')
    sed -i "/$escaped_ssh_key/d" "$temp_file"
    echo "Entrada removida do arquivo"
done

mv "$temp_file" "$authorized_keys_file"

echo "Operação concluída."

vm_name=$(hostname)
vm_ip=$(hostname -I | awk '{print $1}')
mac_address=$(ip link show | awk '/ether/ {print $2}' | head -n 1)
#update_at=$(date +"%Y-%m-%d %T")
api_url="http://recall-api.br-se-1.jaxyendy.com/collect"

response=$(curl -X POST -H "Content-Type: application/json" -d '{
    "vm_name": "'$vm_name'",
    "mac_address": "'$mac_address'"
}' "$api_url" 2>/dev/null)

# Verifique o código de resposta HTTP
http_status=$(echo "$response" | head -n 1 | cut -d' ' -f2)

if [[ "$http_status" =~ ^[0-9]+$ ]]; then
    if [ "$http_status" -eq 200 ]; then
        echo "Dados enviados com sucesso"
    else
        echo "Erro ao enviar, entre em contato com os responsáveis."
        echo "Resposta do servidor: $response"
    fi
else
    echo "Erro: Código de status HTTP não encontrado na resposta."
    echo "Resposta do servidor: $response"
fi