class EquiposPage
  include Capybara::DSL

  def create(equipo)
    page.has_css?("#equipoForm")

    upload(equipo[:imagem]) if equipo[:imagem].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end

  def select_cat(categoria)
    find("#category").find("option", text: categoria).select_option
  end

  def upload(file_name)
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

    find("#thumbnail input[type=file]", visible: false).set thumb
  end
end
