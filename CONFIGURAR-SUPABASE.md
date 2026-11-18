# Portfólio público e edição privada

- Público: `https://glacialmoongames.github.io/portfolio.html`. A página usa o logo e as cores do site e mostra apenas o título **Portfólio** e a composição publicada. Não há login nem ferramentas de edição nessa página.
- Administração: `https://glacialmoongames.github.io/admin.html`. Entre com `glacialmoongames@gmail.com` para editar. A leitura do mural é pública; gravação e uploads estão restritos a esse e-mail pelas políticas do Supabase.
- O endereço `atelier.html` agora serve apenas como retorno invisível de autenticação: encaminha o link de acesso para a área administrativa e preserva a sessão.

No Supabase, deixe **Site URL** como `https://glacialmoongames.github.io` e mantenha `https://glacialmoongames.github.io/atelier.html` na lista de **Redirect URLs**. Isso evita que links novos usem `localhost:3000` como destino. O usuário já está confirmado.

