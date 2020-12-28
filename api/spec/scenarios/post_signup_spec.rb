describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Alexandre Filho", email: "alexandrefilhor@gmail.com", password: "Teste@123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "Valida status code" do
      expect(@result.code).to eql 200
    end

    it "Valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      payload = { name: "Murillo Nunes", email: "murillo@gmail.com", password: "Teste@123" }
      MongoDB.new.remove_user(payload[:email])

      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end

    it "Deve retornar status code 409" do
      expect(@result.code).to eql 409
    end

    it "Deve retornar mensagem de erro" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = [
    {
      title: "Nome Obrigatorio",
      payload: { name: "", email: "francielly@gmail.com", password: "Teste@123" },
      code: 412,
      error: "required name",
    },

    {
      title: "Email Obrigatorio",
      payload: { name: "Alexandre Nunes", email: "", password: "Teste@123" },
      code: 412,
      error: "required email",
    },
    {
      title: "Senha Obrigatoria",
      payload: { name: "Alexandre Nunes", email: "francielly@gmail.com", password: "" },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "Valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "Valida id do usuário" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
