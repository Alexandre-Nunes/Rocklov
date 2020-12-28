Dado("que acesso a página principal") do
  @login_page.open
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, senha|
  @login_page.with(email, senha)
end
