describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = { email: "alexandrenunes@yahoo.com", password: "Teste@123" }
      @result = Sessions.new.login(payload)
    end

    it "Valida status code" do
      expect(@result.code).to eql 200
    end

    it "Valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  examples = [
    {
      title: "senha incorreta",
      payload: { email: "qa.alexandrenunes@gmail.com", password: "123456" },
      code: 401,
      error: "Unauthorized",
    },

    {
      title: "email incorreto",
      payload: { email: "alexandrenunes@gmail.com", password: "Teste@123" },
      code: 401,
      error: "Unauthorized",
    },

    {
      title: "email em branco",
      payload: { email: "", password: "123456" },
      code: 412,
      error: "required email",
    },

    {
      title: "senha em branco",
      payload: { email: "qa.alexandrenunes@gmail.com", password: "" },
      code: 412,
      error: "required password",
    },

    {
      title: "email nao informado",
      payload: { password: "Teste@123" },
      code: 412,
      error: "required email",
    },

    {
      title: "senha nao informada",
      payload: { email: "qa.alexandrenunes@gmail.com" },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
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
