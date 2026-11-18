# Conectar o Ateliê ao Supabase

1. Abra o projeto Supabase que vai guardar as imagens.
2. Clique em **Connect** para copiar a **Project URL** e a **publishable key**. Se a chave publishable ainda não existir, abra **Settings → API Keys**. A chave pública pode começar com `sb_publishable_`; a chave legada `anon` também funciona.
3. No **SQL Editor**, execute todo o conteúdo de `supabase-setup.sql`. Isso cria o mural público e permite editar e enviar arquivos somente para `glacialmoongames@gmail.com`.
4. Em **Authentication → Users**, convide `glacialmoongames@gmail.com` como usuário do projeto, se ainda não estiver na lista. O acesso ao Supabase Dashboard, por si só, não cria um usuário de autenticação.
5. Em **Authentication → URL Configuration**, adicione `https://glacialmoongames.github.io/atelier.html` à lista de Redirect URLs.
6. O código do site já está conectado à Project URL e à publishable key informadas. A chave publishable é feita para uso no navegador; a segurança dos uploads vem das políticas SQL, nunca de esconder essa chave. Não use a chave `secret` ou `service_role` no site.

As imagens publicadas são públicas para que apareçam no site; somente a conta autorizada pode enviar novas imagens ou alterar a composição. A remoção de uma imagem do mural não apaga o arquivo do armazenamento.



Depois que a página estiver publicada e o SQL executado, abra `https://glacialmoongames.github.io/atelier.html`, informe `glacialmoongames@gmail.com` e use o link de acesso enviado por e-mail.
