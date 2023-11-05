# Arquivo que irá popular o banco de dados com dados ficticios afim de realizar testes

# Parte 1
# Criando primeiramente usuários, pois existe alguns registros que dependendem do usuário
User.destroy_all # limpando usuários
[
    {id: 1, name: 'John Doe', email: 'john.doe@email.com', password: '123456', admin: true},
    {id: 2, name: 'Briana Johnson', email: 'briana@email.com', password: '123456', admin: false, master_user_id: 1},
    {id: 3, name: 'Michael Jackson', email: 'mj@email.com', password: '123456', admin: false, master_user_id: 1},

].each do |user|
    User.create!(user)
end

# Parte 2
# Criando as fechaduras
Smartlock.destroy_all # Limpando fechaduras
[
    {id: 1, serial: '0010012023', user_id: 1, manufacturing_date: Time.now},
].each do |smartlock|
    Smartlock.create!(smartlock)
end

# Parte 3
# Criando os acessos feitos pela fechadura
SmartLockAccess.destroy_all # Limpando registros de acesso
10.times do
    user_id = [1,2,3].sample
    SmartLockAccess.create!(user_id: user_id, smartlock_id: 1, type_id: 1)
    SmartLockAccess.create!(user_id: user_id, smartlock_id: 1, type_id: 2)
end

